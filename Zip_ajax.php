<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
require_once('./connections/conn_db.php');

$Zip=sprintf("select town.Name,town.Post,city.Name as Cityname from town,city where town.AutoNo=city.AutoNo and town.townNo='%d'",$_GET["AutoNo"]);
$Zip_rs=$link->query($Zip);
$Zip_num=$Zip_rs->rowCount();
if($Zip_num>0){
    $Town_rows=$Zip_rs->fetch();
    $retcode=array("c"=>"1","Post"=>$Town_rows['Post'],"Name"=>$Town_rows['Name'],"Cityname"=>$Town_rows['Cityname']);
}
else{
    $retcode=array("c"=>"0","m"=>'找不到相關資料');
}
echo json_encode($retcode);
return;
?>