<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
require_once('./connections/conn_db.php');

if(isset($_GET['emailid']) && $_GET['emailid']!=''){
    $emailid = $_GET['emailid'];
    $PWNew1 = $_GET['PWNew1'];
    $query=sprintf("UPDATE member set pw1='%s' where member.emailid='%d'",$PWNew1,$emailid);
    $result = $link->query($query);
    if($result){
        $retcode=array("c"=>"1","m"=>'會員密碼已更新');
    }
    else{
        $retcode=array("c"=>"0","m"=>'抱歉！資料無法連接到後台資料庫');
    }
    echo json_encode($retcode);
}
return;
?>