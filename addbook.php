<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
require_once('./connections/conn_db.php');
(!isset($_SESSION)) ? session_start() : "";

if(isset($_SESSION['emailid']) && $_SESSION['emailid']){
    $emailid=$_SESSION['emailid'];
    $cname=$_POST['cname'];
    $mobile=$_POST['mobile'];
    $myZip=$_POST['myZip'];
    $address=$_POST['address'];
    $query=sprintf("update addbook set setdefault='0' where emailid='%d' and setdefault='1';",$emailid);
    $result=$link->query($query);
    $query="insert into addbook(setdefault,emailid,cname,mobile,myZip,address) values ('1','".$emailid."','".$cname."','".$mobile."','".$myZip."','".$address."')";
    $result=$link->query($query);
    if($result){
        $retcode=array("c"=>1,"m"=>"收件人資料新增成功");
    }
    else{
        $retcode=array("c"=>0,"m"=>"抱歉!資料無法寫入後台資料庫");
    }
    echo json_encode($retcode);
}
return;
?>