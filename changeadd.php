<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
require_once('./connections/conn_db.php');
(!isset($_SESSION)) ? session_start() : "";


if(isset($_SESSION['emailid']) && $_SESSION['emailid'] !=""){
    $emailid=$_SESSION['emailid'];
    $addressid=$_POST['addressid'];
    // 先修改預設收件人取消
    $query=sprintf("update addbook set setdefault ='0' where emailid='%d' and setdefault='1';",$emailid);
    $result=$link->query($query);
    // 將選定收件人設為預設收件人
    $query=sprintf("update addbook set setdefault ='1' where addressid='%d';",$addressid);
    $result=$link->query($query);
    if($result){
        $retcode=array("c"=>"1","m"=>'收件人已變更');
    }
    else{
        $retcode=array("c"=>"0","m"=>'抱歉!資料無法寫入後台資料庫');
    }
    echo json_encode($retcode);
}
return;
?>