<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
require_once('Connections/conn_db.php');

if(isset($_GET['p_id']) && isset($_GET['qty']) && isset($_GET['p_size'])){
    $p_id = $_GET['p_id'];
    $qty = $_GET['qty'];
    $p_size = $_GET['p_size'];
    $u_ip = $_SERVER['REMOTE_ADDR'];

    // 查詢是否有相同產品編號和尺寸
    $query = "SELECT * FROM cart WHERE p_id = $p_id AND p_size = '$p_size' AND ip = '$u_ip' AND orderid IS NULL";
    $result = $link->query($query);

    if($result){
        if($result->rowCount() == 0){
            // 如果購物車內沒有該商品，則新增
            $query = "INSERT INTO cart (p_id, qty, p_size, ip) VALUES ($p_id, $qty, '$p_size', '$u_ip');";
        }
        else{
            $cart_data = $result->fetch();
            if($cart_data['qty'] + $qty > 49){
                $qty = 49;
            }
            else{
                $qty = $qty + $cart_data['qty'];
            }
            // 更新購物車數量
            $query = "UPDATE cart SET qty = $qty WHERE cart.cartid = ".$cart_data['cartid'];
        }
        $result = $link->query($query);
        $retcode = array("c" => "1", "m" => '感謝您！產品已加入購物車');
    }
    else{
        $retcode = array("c" => "0", "m" => '抱歉! 資料無法寫入後台資料庫');
    }
    echo json_encode($retcode);
}
return;
?>
