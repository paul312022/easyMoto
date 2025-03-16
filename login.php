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
<?php
if(isset($_GET['sPath'])){
  $sPath=$_GET['sPath'] . ".php";
}
else{
  // 登入完成預設進入首頁
  $sPath="product.php";
}
// 檢查是否完成登入驗證
if(isset($_SESSION['login'])){
  header(sprintf("location:%s",$sPath));
}
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
  <!-- 會員登入專用css -->
  <style type="text/css">

    /* card component */
    .mycard.mycard-container{
      max-width: 400px;
      height: 450px;
    }

    .mycard{
      background-color: #f7f7f7;
      padding: 20px 25px 30px;
      margin: 0 auto 25px;
      margin-top: 50px;
      -moz-border-radius:10px;
      -webkit-border-radius:10px;
      border-radius: 10px;
    }

    .profile-img-card{
      margin: 0 auto 10px auto;
      display: block;
      width: 100px;
    }

    .profile-name-card{
      font-size: 20px;
      text-align: center;
    }

    .form-signin input[type="email"],.form-signin input[type="password"],.form-signin button{
      width: 100%;
      height: 44px;
      font-size: 16px;
      display: block;
      margin-bottom: 20px;
    }

    .btn.btn-signin{
      font-weight: 700;
      background-color: rgb(104,145,162);
      color: white;
      height: 38px;
      transition: background-color 1s;
    }

    .btn.btn-signin:hover,.btn.btn-signin:active,.btn.btn-signin:focus{
      background-color: rgb(12,97,33);
    }

    .other a{
      color: rgb(104,145,162);
    }

    .other a:hover,.other a:active,.other a:focus{
      background-color: rgb(12,97,33);
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
 <!-- 會員登入頁面 -->
 <div class="mycard mycard-container">
  <img id="profile-img" class="profile-img-card" src="images/logo03.svg" alt="log">
  <p id="profile-name" class="profile-name-card">會員登入</p>
  <form action="" method="POST" class="form-signin" id="form1">
    <input type="email" name="inputAccount" id="inputAccount" class="form-control" placeholder="Account" required autofocus />
    <input type="password" name="inputPassword" id="inputPassword" class="form-control" placeholder="Password" required />
    <button type="submit" class="btn btn-signin mt-4">登入</button>
  </form>
  <div class="other mt-5 text-center">
    <a href="register.php">創建帳號/</a>
    <a href="#">忘記密碼</a>
  </div>
 </div>
      </div>
    </div>
  </section>
  <!-- 關於我們 -->
  <?php require_once("./html/aboutme.php") ?>
  <!-- 載入畫面 -->
  <div id="loading" name="loading" style="display:none;position:fixed;width:100%;height:100%;top:0;left:0;background-color:rgba(255,255,255,0.5);z-index:9999;"><i class="fas fa-spinner fa-spin fa-5x fa-fw" style="position: absolute;top:50%;left:50%"></i></div>

</body>
<!-- 外部js連結 -->
<?php require_once("./html/js.php") ?>
<!-- header網路素材 -->
<script src="./menu_hover_video.js"></script>
<script type="text/javascript" src="commlib.js"></script>

<script type="text/javascript">
  // 登入帳號密碼提交
    $(function(){
      $("#form1").submit(function(){
        const inputAccount = $("#inputAccount").val();
        const inputPassword = MD5($("#inputPassword").val());
        $("#loading").show();
        // 利用ajax函數呼叫後台的auth_user.php驗證帳號密碼
        $.ajax({
          url:'auth_user.php',
          type:'post',
          dataType:'json',
          data:{
            inputAccount:inputAccount,
            inputPassword:inputPassword,
          },
          success:function(data){
            if(data.c==true){
              alert(data.m);
              // window.location.reload();
              window.location.href="<?php echo $sPath ?>";
            }
            else{
              alert(data.m);
            }
          },
          error:function(data){
            alert("系統目前無法連結至後台資料庫");
          }
        });
      });
    });
  </script>



</html>