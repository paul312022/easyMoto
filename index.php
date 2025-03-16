<?php
//載入共用php函數庫
require_once("php_lib.php");

// 確保編碼設置
header('Content-Type: text/html; charset=utf-8');

//如果session沒有啟動 則啟動session功能 這是跨網頁變數存取
(!isset($_SESSION)) ? session_start() : "";

//這是將資料庫 連線程式載入
require_once('./connections/conn_db.php');
?>


<!doctype html>
<html lang="zh-TW">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>毅立人身部品</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="website_p01.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.2.1/css/all.css">
</head>

<body>
  <!-- 頂部影片選單區 -->
  <section id="header">
    <div class="video-background">
      <video src="./images/index_video.mp4" id="video-background" muted autoplay loop></video>
      <img src="./images/logo.png" id="video_logo" title="">
      <a href="./product.php?classid=1&level=1" id="video_helmet_link">
        <img src="./images/helmet.png" class="video_helmet">
      </a>
      <a href="./product.php?classid=2&level=1" id="video_suit_link">
        <img src="./images/jacket.png" class="video_suit">
      </a>
      <a href="./product.php?classid=3&level=1" id="video_hand_link">
        <img src="./images/gloves.png" class="video_hand">
      </a>
    </div>
  </section>
  <!-- 右側區域切換按鈕 -->
  <?php require_once("./html/side-nav.php")?>
  <!-- 中層宣傳圖 -->
  <?php require_once("./html/content.php")?>
  <!-- 關於我們 -->
  <?php require_once("./html/aboutme.php")?>
  
</body>

<!-- 外部js連結 -->
<?php require_once("./html/js.php")?>
<!-- header自己素材 -->
<script src="./menu_hover_video_useMyVideo.js"></script>
</html>