<?php require_once("connections/conn_db.php"); ?>
<?php
if(isset($_GET['mode']) && $_GET['mode']!=''){
    $mode=$_GET['mode'];
    switch($mode){
        case 1:
            // 使用購物車編號刪除內容
            $SQLstring=sprintf("delete from cart where cartid=%d and orderid is null",$_GET['cartid']);
            break;
        case 2:
            // 使用IP清空購物車編號所有內容
            $SQLstring=sprintf("delete from cart where ip='%s' and orderid is null",$_SERVER['REMOTE_ADDR']);
            break;
    }
    $result=$link->query($SQLstring);
}
$deleteGoto="cart.php";
header(sprintf("location:%s",$deleteGoto));
?>