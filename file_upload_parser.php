<?php
$fileName = $_FILES['file1']['name'];
$fileTmpLoc = $_FILES['file1']['tmp_name'];
$fileType = $_FILES['file1']['type'];
$fileSize = $_FILES['file1']['size'];
$fileErrorMsg = $_FILES['file1']['error'];

if(!$fileTmpLoc){
    $retcode=array('success'=>'false','msg'=>'','error'=>'上傳暫存檔無法建立','fileName'=>'');
    echo json_encode($retcode);
    exit();
}
if(move_uploaded_file($fileTmpLoc,"uploads/$fileName")){
    $retcode=array('success'=>'true','msg'=>'完成檔案上傳','error'=>'','fileName'=>$fileName);
}
else{
    $retcode=array('success'=>'false','msg'=>'','error'=>'檔案未上傳完成','fileName'=>'');
}
echo json_encode($retcode);
exit();
?>