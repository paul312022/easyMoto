<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
require_once('./connections/conn_db.php');

if(isset($_GET['emailid']) && $_GET['emailid']!=''){
    $emailid = $_GET['emailid'];
    $birthday = $_GET['birthday'];
    $cname = $_GET['cname'];
    $imgname = $_GET['imgname'];
    $tssn = $_GET['tssn'];
    $query=sprintf("UPDATE member set cname='%s',birthday='%s',imgname='%s',tssn='%s' where member.emailid='%d'",$cname,$birthday,$imgname,$tssn,$emailid);
    $result = $link->query($query);
    if($result){
        (!isset($_SESSION)) ? session_start() : "";
        $_SESSION['cname']=$cname;
        $_SESSION['imgname']=$imgname;
        $retcode=array("c"=>"1","m"=>'會員資料已更新');
    }
    else{
        $retcode=array("c"=>"0","m"=>'抱歉！資料無法連接到後台資料庫');
    }
    echo json_encode($retcode);
}
return;
?>