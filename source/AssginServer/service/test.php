<?php
    /**
     * Created by PhpStorm.
     * User: zn
     * Date: 2018/12/29
     * Time: 23:20
     */
//    $sql = $_GET['sql_file'];
    $command = $_GET['command'];
    if(!empty($command)) {
        echo "Test mysql command </br>";
//        $file = "/tmp/E792CE580F539F125C2F425E92CEF88B/site_assgin.sql";
//        $file = $sql;
//        $command = "mysql -ulitecart -pdiev7Ugh3fushieV1che litecart < ".$file." 2>&1";

        $str = exec($command, $out, $re);
        echo '<pre>';
        print_r(array('cmd' => $command, 'exec_return' => $str, 'exec_out' => $out, 'exe_re' => $re));
        echo '</pre>';
    }else {
        echo "command:".$command;
    }

    ?>
 <form name="" action="test.php">
<!--     <label>sql文件路径:</label><input type="text" name="sql_file" style="width:400"></br>-->
     <label>Mysql command:</label>
     <input type="text" name="command" style="width:900px" value="mysql -ulitecart -P50001 -pdiev7Ugh3fushieV1che -h107.191.41.198 < /var/www/html/AssginServer/service/site_assgin.sql 2>&1"></br>
     <input type="submit" value="test">
 </form>
