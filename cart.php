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

  <style type="text/css">
    /* 輸入有誤時 顯示紅框 */
    table input:invalid {
      border: red solid 3px;
    }
  </style>
</head>

<body>
  <!-- 頂部選單區 -->
  <?php require_once("./html/navbar.php")?>
  <!-- 右側區域切換按鈕 -->
  <!-- <?php require_once("./html/side-nav.php") ?> -->
  <!-- 中間展示區 -->
  <section id="content">
    <div id="carouselExampleControls" class="carousel row slide mx-auto" data-bs-ride="carousel">
      <div class="col-12 col-lg-2">
        <!-- 左側sidebar分類導覽 -->
        <?php require_once("./html/sidebar.php") ?>
        <!-- 熱銷商品區 -->
        <?php require_once("./html/hot.php") ?>
      </div>
      <div class="col-12 col-lg-10">
        <!-- 麵包屑模組 -->
        <?php require_once("./html/breadcrumb.php") ?>
        <!-- 購物車模組 -->
        <?php require_once("./html/cart_content.php") ?>
      </div>
    </div>
  </section>
  <!-- 關於我們 -->
  <?php require_once("./html/aboutme.php") ?>

</body>
<!-- 外部js連結 -->
<?php require_once("./html/js.php") ?>
<!-- ***引入javascript檔案*** -->
<?php require_once("./html/jsfile.php") ?>
<!-- header網路素材 -->
<script src="./menu_hover_video.js"></script>
<script type="text/javascript">
  // 將變更的數量寫入後台資料庫
  $("input").change(function() {
    var qty = $(this).val();
    const cartid = $(this).attr("cartid");
    if (qty <= 0 || qty >= 3) {
      alert("數量需大於1,以及小於2(包含)");
      return false;
    }
    $.ajax({
      url: 'change_qty.php',
      type: 'post',
      dataType: 'json',
      data: {
        cartid: cartid,
        qty: qty,
      },
      success: function(data) {
        if (data.c == true) {
          alert(data.m);
          window.location.reload();
        } else {
          alert(data.m);
        }
      },
      error: function(data) {
        alert("系統無法連接到後台資料庫");
      }
    });
  });
  $(document).ready(function() {
    $(".p_size").change(function() {
        var p_size = $(this).val();
        var cartid = $(this).attr("cartid");

        $.ajax({
            url: 'change_size.php', // 新增的 PHP 處理檔案
            type: 'post',
            dataType: 'json',
            data: {
                cartid: cartid,
                p_size: p_size,
            },
            success: function(data) {
                if (data.c == true) {
                    alert(data.m);
                } else {
                    alert(data.m);
                }
            },
            error: function() {
                alert("系統無法連接到後台資料庫");
            }
        });
    });
});

</script>



</html>