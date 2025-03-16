<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
require_once('./connections/conn_db.php');

if(isset($_POST['cartid']) && isset($_POST['qty'])){
    $cartid=$_POST['cartid'];
    $qty=$_POST['qty'];
    $query=sprintf("update cart set qty='%d' where cart.cartid=%d",$qty,$cartid);
    $result=$link->query($query);
    if($result){
        $retcode=array("c"=>"1","m"=>'產品數量已更新');
    }
    else{
        $retcode=array("c"=>"0","m"=>'抱歉!資料無法寫入後台資料庫');
    }
    echo json_encode($retcode);
}
return;
?>