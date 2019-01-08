<?php

    /**
     * Created by PhpStorm.
     * User: zn
     * Date: 2018/9/14
     * Time: 10:15
     */
    class Util
    {
        private static $fliterWords = array(
            '`','·','~','!','！','@','#','$','￥','%','^','……','&','*','(',')','（',
            '）','-','_','——','+','=','|','\\','[',']','【','】','{','}',';','；',':','：','\'','"','“',
            ',','，','<','>','《','》','.','。','/','、','?','？');
        /**
         * 该方法将占位符sql 处理为有具体值的字符串。
         * @param $format_sql 带格式化的sql
         * @param $parameter_values 参数。
         * 如果$parameter_values 参数值个数和$format_sql 里的格式化字符个数不一致，则会出现错误。
         *
         */
        private static function builderSQL(&$format_sql, &$parameter_values = array())
        {
            return vsprintf($format_sql, $parameter_values);
        }

        /**
         * 获取格式化的日期字符串。
         * @return false|string
         *
         */
        private static function getYMDHISDate($format = 'Y-m-d H:i:s')
        {
            return date($format);
        }

        /**
         * 获得数组指定索引的值。
         * @param $array 数字索引数组
         * @param $index 需要取值的索引
         * @return mixed 返回索引指定的值，如果索引越界，返回"";
         */
        private static function getArrayIndexValue($array, $index)
        {
            if ($index <= count($array) - 1) {
                return $array[$index];
            } else {
                return "";
            }
        }

        /**
         * 判断一个字符串是否以$start_str代表的字符串开头。如果是返回true，否则返回false；
         * @param $start_str ： 开头的字符串
         * @param $str 要查找的字符串
         */
        private static function startWith($start_str, $str="")
        {
            $start_str_length = strlen($start_str);
            $start_str_tmp = substr($str, 0, $start_str_length);
            if ($start_str_tmp === $start_str) {
                return true;
            }
            return false;
        }
        /**
         * 判断一个字符串是否以$start_str代表的字符串开头。如果是返回true，否则返回false；
         * @param $start_str ： 开头的字符串
         * @param $str 要查找的字符串
         */
        public static function endWith($end_str, $str)
        {
            $start_str_length = strlen($end_str);
            $start_str_tmp = substr($str, strlen($str)-$start_str_length);
            if ($start_str_tmp === $end_str) {
                return true;
            }
            return false;
        }

        /**
         * 发送http请求
         * @param $url 请求的url
         * @param string $method 如果为空，则采用get方式发送请求。
         * @param array $params 参数列表
         * @param number $timeout 超时时间，单位秒。
         * @return bool|string 发送失败，则返回false。否则返回一个字符串。字符串内容由url服务提供方决定。
         */
        private static function sendHttpRequest($url, $method = 'post', $params = array(), $timeout = 60)
        {
            $client = new http_client();
            $response_str = $client->call($method, $url, $params);
            return $response_str;
        }

        /**
         * 该方法检查一组参数里是否有空的数据，如果有返回true，如果都不为空 返回false；
         * @param array ...$paramters
         * @return bool
         */
        public static function checkEmpty(...$paramters)
        {
            $isEmpty = false;
            foreach ($paramters as $item) {
                $isEmpty = empty($item);
                if ($isEmpty == true) {
                    break;
                }
            }

            return $isEmpty;
        }

        /**
         * 生成唯一id
         * @param int $lenght id长度
         * @return bool|string
         * @throws Exception
         */
        public static function uniqidReal($lenght = 13)
        {
            // uniqid gives 13 chars, but you could adjust it to your needs.
            if (function_exists("random_bytes")) {
                $bytes = random_bytes(ceil($lenght / 2));
            } elseif (function_exists("openssl_random_pseudo_bytes")) {
                $bytes = openssl_random_pseudo_bytes(ceil($lenght / 2));
            } else {
                throw new Exception("no cryptographically secure random function available");
            }

            return substr(bin2hex($bytes), 0, $lenght);
        }

        /**
         * 创建一个32 or 36 字符的guid，
         * @param bool $isNotHR 是否去掉guid中的 - 符号。 truea表示去除，false表示不去除
         * @param bool $opt 是否保留生成的guid中{}符号。true表示保留，false表示不保留
         * @return mixed|string
         * 如果 $isNotHR 为true，得到一个32个字符的guid字符串：C525A3C3B0194218B3D70026CE7CDDEB
         * 如果$isNotHR 为false，得到一个36个字符的guid字符串:64886563-5C7E-448D-86E9-DDC759DCEA71
         */
        public static function guid($isNotHR = true, $opt = false)
        {
            $guid = "";
            if (function_exists('com_create_guid')) {
                $guid = com_create_guid();
            } else {
                mt_srand((double)microtime() * 10000);    // optional for php 4.2.0 and up.
                $charid = strtoupper(md5(uniqid(rand(), true)));
                $hyphen = chr(45);    // "-"
                $left_curly = $opt ? chr(123) : "";     //  "{"
                $right_curly = $opt ? chr(125) : "";    //  "}"
                $uuid = $left_curly
                    . substr($charid, 0, 8) . $hyphen
                    . substr($charid, 8, 4) . $hyphen
                    . substr($charid, 12, 4) . $hyphen
                    . substr($charid, 16, 4) . $hyphen
                    . substr($charid, 20, 12)
                    . $right_curly;

                $guid = $uuid;
            }
            if ($opt === false) {
                $guid = trim($guid, "{}");
            }
            if ($isNotHR === true) {
                $guid = str_replace("-", "", $guid);
            }

            return $guid;
        }

        /**
         * 解压zip文件
         * @param $zipSource zip源文件
         * @param $unZipFloder 解压目录
         * @return  true or false
         *  Returns true on success or false on failure.
         */
        public static function unZip($zipSource, $unZipFloder)
        {
            $zip = new ZipArchive();
            $result = $zip->open($zipSource);
            if ($result === true) {
                $result = $zip->extractTo($unZipFloder);
            }

            return $result;
        }

        /**
         * 压缩文件，将一个或多个文件压缩位zip文件。改方法不支持目录压缩
         * @param $zipFilePath zip文件路径
         * @param array $filePaths 需要压缩的一个或多个文件
         */
        public static function zip($zipFilePath, $filePaths = array())
        {
            if (empty($filePaths)) {
                return;
            }
            $zip = new ZipArchive();
            $zip->open($zipFilePath, ZipArchive::CREATE);   //打开压缩包
            foreach ($filePaths as $file) {
                $zip->addFile($file, basename($file));   //向压缩包中添加文件
            }
            $zip->close();
        }

        /**
         * 获取文件类型，该方法还未实现。 暂不可用。
         * @param $filePath
         * 格式：
         *  text/plain; charset=utf-8
         * application/zip; charset=binary
         * image/jpeg; charset=binary
         * image/webp; charset=binary
         * image/png; charset=binary
         */
        public static function getFileMIME($filePath)
        {
            $fileInfo = finfo_open(FILEINFO_MIME);
            $fileMime = finfo_file($fileInfo, $filePath);
            finfo_close($fileInfo);

            return $fileMime;
        }

        /**
         * 创建多级目录,
         * @param $dirPath
         * @return true or false
         * 如果目录不存在则创建，存在则不创建
         */
        public static function mkdirs($dirPath)
        {
            if (!is_dir($dirPath)) {
                return mkdir($dirPath, 0777, true);
            }
        }

        /**
         * 获取指定目录下的文件名列表。注意，改方法只会获得文件名，如果想获得文件的绝对路径，请使用fileAbsolutePaths方法
         * @param $folder
         * @return array
         */
        public static function files($folder)
        {
            $files = scandir($folder);
            foreach ($files as $key => $value) {
                if ($value == '.' || $value == '..') {
                    unset($files[$key]);
                }
            }
            return $files;
        }

        /**
         * @param $folder
         * @return array
         */
        public static function fileAbsolutePaths($folder)
        {
            $files = scandir($folder);
            foreach ($files as $key => $value) {
                if ($value == '.' || $value == '..') {
                    unset($files[$key]);
                } else {
                    $files[$key] = $folder . "/" . $value;
                }
            }

            return $files;
        }

        public static function deleteFile($filePath)
        {
            return unlink($filePath);
        }

        /**
         * 删除目录和目录下的所有子目录以及文件
         * @param $dirName 需要删除的目录路径
         */
        public static function deleteDirectoryAndFile($directoryPath)
        {
            if ($handle = opendir($directoryPath)) {// 打开目录句柄
                while (false !== ($item = readdir($handle))) {//从目录句柄中读取条目(改目录下的子文件或目录)
                    if ($item != "." && $item != "..") {
                        $child = $directoryPath . "/" . $item;
                        if (is_dir($child)) {//判断当前是否是一个目录,如果是则向下搜索。
                            self::deleteDirectoryAndFile($child);
                        } else {// 否则删除当前的文件
                            unlink($child);
                        }
                    }
                }
                closedir($handle);// 关闭句柄释放资源
                rmdir($directoryPath);//清除目录。
            }
        }

        /**
         * 检查文件或目录是否存在
         * @param string $filePath
         * @param bool $isFile 如果监测的是目录是否存在，该值为false
         * @return bool
         */
        public static function exists($filePath="",$checkFile=true) {
            if($checkFile) {
                return is_file($filePath);
            } else {
                return is_dir($filePath);
            }
        }
    }