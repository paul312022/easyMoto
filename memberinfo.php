<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
require_once('./connections/conn_db.php');

if(isset($_GET['emailid']) && $_GET['emailid']!=''){
    $emailid = $_GET['emailid'];
    $query = sprintf("SELECT emailid,email,cname,tssn,birthday,imgname from member where emailid=%d",$emailid);
    $result = $link->query($query);
    if($result){
        $data=$result->fetchAll(PDO::FETCH_ASSOC);
        $retcode=array("c"=>"1","m"=>'',"d"=>$data);
    }
    else{
        $retcode=array("c"=>"0","m"=>'抱歉！資料無法連接到後台資料庫');
    }
    echo json_encode($retcode);
}
return;
?>