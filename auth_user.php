<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');
(!isset($_SESSION)) ? session_start() : "";
require_once('./connections/conn_db.php');
if(isset($_POST['inputAccount']) && isset($_POST['inputPassword'])){
    $inputAccount=$_POST['inputAccount'];
    $inputPassword=$_POST['inputPassword'];
    $query=sprintf("select * from member where email='%s' and pw1='%s'",$inputAccount,$inputPassword);
    $result=$link->query($query);
    if($result){
        if($result->rowCount()==1){
            $data=$result->fetch();
            if($data['active']){
                $_SESSION['login']=true;
                $_SESSION['emailid']=$data['emailid'];
                $_SESSION['email']=$data['email'];
                $_SESSION['cname']=$data['cname'];
                $_SESSION['imgname']=$data['imgname'];//加入會員頭像
                $retcode=array("c"=>"1","m"=>'會員驗證成功');
            }
            else{
                $retcode=array("c"=>"2","m"=>'會員帳號鎖定中 請聯絡管理人員');
            }
        }
        else{
            $retcode=array("c"=>"2","m"=>'帳號密碼錯誤 請重新輸入');
        }
    }
    else{
        $retcode=array("c"=>"0","m"=>'會員驗證錯誤 請聯絡管理人員');
    }
echo json_encode($retcode);
}
return;
?>