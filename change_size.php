<?php
require_once('./connections/conn_db.php');
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $cartid = $_POST['cartid'];
    $p_size = $_POST['p_size'];

    if (!empty($cartid) && !empty($p_size)) {
        $SQLstring = "UPDATE cart SET p_size = ? WHERE cartid = ?";
        $stmt = $link->prepare($SQLstring);
        $stmt->execute(array($p_size, $cartid));

        if ($stmt->rowCount() > 0) {
            echo json_encode(array("c" => true, "m" => "尺寸更新成功"));
        } else {
            echo json_encode(array("c" => false, "m" => "尺寸未變更或更新失敗"));
        }
    } else {
        echo json_encode(array("c" => false, "m" => "資料錯誤"));
    }
}
?>
