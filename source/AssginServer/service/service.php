<?php
    require_once("../utils/Util.php");
    set_time_limit(0);//设置脚本执行时间
    /**
     * 所有拉去sql，执行sql入库，以及向服务器发送完成情况的主服务入口
     * Created by PhpStorm.
     * User: zn
     * Date: 2018/12/21
     * Time: 18:30
     */
    // 方案一:
    //1. 接收数据中心的拉取sql文件的通知
    //2. 接到通知后，拿到服务器的ip地址，用户名和密码以及需要登陆的目录地址，以及唯一的令牌码，文件md5值(第一行和最后一行数据做md5)，文件长度。
    //3. 发送消息，告诉数据中心收到拉取请求，开始准备拉取
    //4. 发送 ssh命令登陆数据中心服务器指定目录，然后开始scp。
    //5. 拉取完成后,做md5和长度验证文件是否完整。
    //  5.1 如果不完整发送给服务器，表示当此不完整，需要重新拉取，如果连续三次失败，则不再处理
    //  5.2 如果校验完整，发送数据给数据中心表示完毕。
    // 方案二：
    //1. 接收数据中心的上传的sql压缩文件
    //2. 解压文件
    //3. 执行命令
    //4. 删除文件
    // 问题：每个网站在部署时如何知道自己对应的库？部署时应该怎么处理这个问题？
    /**
     * 上传文件
     */

//    if (isset($_POST['upload_sql'])) {
        logToFile("File uploading...");
        upload();
//    } else {
//        echo "not parameter:upload_sql";
//    }
     function upload() {
         $FILE_TYPE = $_FILES['file']['type'];//上传的文件类型
         $TMP_FILE = $_FILES['file']['tmp_name'];// 临时存放文件的目录
         $TMP_DIR = dirname($TMP_FILE);
         $uuid = Util::guid();
         $dbIp = $_POST['db_ip'];
         $dbPort = $_POST['db_port'];
         logToFile("uuid:".$uuid);
         echo $uuid;
         $UNZIP_DIR = $TMP_DIR . "/" .$uuid."/";// zip解压目录路径
         logToFile($FILE_TYPE."-".$TMP_FILE."-".$TMP_DIR."-".$UNZIP_DIR);

         try {
         if (empty($TMP_FILE) || !is_uploaded_file($TMP_FILE)) {
             logToFile('error_must_select_file_to_upload', 'You must select a file to upload');
         }
         ob_clean();
         header('Content-Type: text/plain; charset=UTF-8');
         // 判断是不是zip文件，如果是zip解压后读取。x-zip-compressed
//        if ($FILE_TYPE === 'application/x-zip-compressed') {
             if(!Util::exists($UNZIP_DIR)) {
                 Util::mkdirs($UNZIP_DIR);//创建解压目录
             }
             // 解压zip，到临时目录
             $is_unzip = Util::unZip($TMP_FILE, $UNZIP_DIR);
            logToFile("is_unzip:".$is_unzip);
             $files = Util::files($UNZIP_DIR);
             if ($is_unzip === true) {//如果解压成功
                 // 1. 获取解压目录下的文件列表
                 $files = Util::files($UNZIP_DIR);
                 foreach ($files as $key => $file) {//遍历解压目录下的文件
                     if(Util::endWith("sql",$file)) {
                         $file = $UNZIP_DIR . "/" . $file;// 拼接需要读取的sql文件文件路径
                         //  执行mysql命令
                         $start = date('H:i:s');
                         $command = "mysql -ulitecart -P".$dbPort." -pdiev7Ugh3fushieV1che -h".$dbIp." litecart < ".$file." 2>&1";
                         exec($command,$out, $re);
                         $end = date('H:i:s');
                         logToFile("file:".$file);
                         $mesage = "message:".$file."In DB succeed, elapsed time:".(strtotime($end) - strtotime($start));
                         print_r(array('cmd' => $command, 'exec_out' => $out, 'status' => $re));
                         echo $mesage;
                     }
                 }
             } else {
                 echo "unzip file error.";
             }
             // 删除临时解压目录下的所有数据
//             Util::deleteDirectoryAndFile(UNZIP_DIR);
//            echo "没有任何zip文件";
//         }

        } catch (Exception $e) {
             echo $e;
        }
         exit;
     }
     function logToFile($message) {
         $logFile = "/root/logs/assgin_log.log";
         $logFold = dirname($logFile);
         Util::mkdirs($logFold);
         file_put_contents($LOG_FILE, $message."\n",FILE_APPEND);
     }
//     echo "dd";