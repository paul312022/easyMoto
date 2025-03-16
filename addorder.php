<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
require_once('./connections/conn_db.php');
(!isset($_SESSION)) ? session_start() : "";


if(isset($_SESSION['emailid']) && $_SESSION['emailid'] !=""){
    $emailid=$_SESSION['emailid'];
    $addressid=$_POST['addressid'];
    $ip=$_SERVER['REMOTE_ADDR'];
    $orderid=date('Ymdhis').rand(10000,99999);//自行產生時間+訂單編號
    $query=sprintf("insert into uorder (orderid,emailid,addressid,howpay,paystatus,status) values('%s','%d','%d','3','35','7');",$orderid,$emailid,$addressid);
    $result=$link->query($query);

    if($result){
        $query=sprintf("update cart set orderid='%s',emailid='%d',status='8' where ip='%s' and orderid is null;",$orderid,$emailid,$ip);
        $result=$link->query($query);
        $retcode=array("c"=>"1","m"=>'謝謝你，系統已完成結帳，請在首頁查閱訂單處理狀態');
    }
    else{
        $retcode=array("c"=>"0","m"=>'抱歉!資料無法寫入後台資料庫');
    }
    echo json_encode($retcode);
}
return;
?>