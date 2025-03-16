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
    .input-group>.form-control{
      width: 100%;
    }
    /* 建立錯誤與成功驗證的css */
    span.error-tips,span.error-tips::before{
      font-family: "font awesome 5 free";
      color: red;
      font-weight: 900;
      content: "\f00d";  /* 顯示unicode編碼內容 (可以使用bootstrap的icon 也有unicode編碼格式) */
    }
    span.valid-tips,span.valid-tips::before{
      font-family: "font awesome 5 free";
      color: greenyellow;
      font-weight: 900;
      content: "\f00c";  /* 顯示unicode編碼內容  (可以使用bootstrap的icon 也有unicode編碼格式) */
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

  <?php
if(isset($_POST['formctl']) && $_POST['formctl'] == 'reg'){
  $email = $_POST['email'];
  $pw1 = md5($_POST['pw1']);   //密碼使用MD5加密
  $cname = $_POST['cname'];
  $tssn = $_POST['tssn'];
  $brithday = $_POST['brithday'];
  $mobile = $_POST['mobile'];
  $myzip = $_POST['myZip'] == ''? null : $_POST['myZip'];
  $address = $_POST['address'] == ''? null : $_POST['address'];
  $imgname = $_POST['uploadname'] == ''? null : $_POST['uploadname'];
  $insertsql = 'insert into member (email,pw1,cname,tssn,birthday,imgname) values ("' . $email . '","' . $pw1 . '","' . $cname . '","' . $tssn . '","' . $brithday . '","' . $imgname . '")';
  $Result = $link->query($insertsql);
  $emailid = $link->lastInsertId();   // 取得新增的會員編號
  if($Result){
    // 將會員的資訊寫入addbook資料表
    $insertsql = 'insert into addbook (emailid,setdefault,cname,mobile,myzip,address) values ("' . $emailid . '",1,"' . $cname . '","' . $mobile . '","' . $myzip . '","' . $address . '")';
    $Result = $link->query($insertsql);
    $_SESSION['login'] = true;
    $_SESSION['emailid'] = $emailid;
    $_SESSION['email'] = $email;
    $_SESSION['cname'] = $cname;
    echo "<script language='javascript'>alert('您的會員資料完成註冊');location.href='product.php'</script>";
  }
} 
?>

    <div id="carouselExampleControls" class="carousel row slide mx-auto" data-bs-ride="carousel">
      <div class="col-12 col-lg-2">
        <!-- 左側sidebar分類導覽 -->
        <?php require_once("./html/sidebar.php") ?>
        <!-- 熱銷商品區 -->
        <?php require_once("./html/hot.php") ?>
      </div>
      <div class="col-12 col-lg-10">
<!-- 會員註冊頁面 -->
<div class="row web_bgc">
  <div class="col-12 text-center">
    <h1>會員註冊頁面</h1>
    <p>請輸入相關資料，*為必填欄位</p>
  </div>
 </div>
 <div class="row web_bgc">
  <div class="col-8 offset-2 text-left">
    <form action="register.php" id="reg" name="reg" method="POST">
      <div class="input-group mb-3">
        <input type="email" name="email" id="email" class="form-control" placeholder="*請輸入電子郵件帳號" autocomplete="off">
      </div>
      <div class="input-group mb-3">
      <input type="password" name="pw1" id="pw1" class="form-control" placeholder="*請輸入密碼">
      </div>
      <div class="input-group mb-3">
      <input type="password" name="pw2" id="pw2" class="form-control" placeholder="*請再次確認密碼">
      </div>
      <div class="input-group mb-3">
      <input type="text" name="cname" id="cname" class="form-control" placeholder="*請輸入姓名">
      </div>
      <div class="input-group mb-3">
      <input type="text" name="tssn" id="tssn" class="form-control" placeholder="*請輸入身分證字號">
      </div>
      <div class="input-group mb-3">
      <input type="text" name="brithday" id="brithday" onfocus="(this.type='date')" class="form-control" placeholder="*請選擇生日">
      </div>
      <div class="input-group mb-3">
      <input type="text" name="mobile" id="mobile" class="form-control" placeholder="*請輸入手機號碼">
      </div>
      <div class="input-group mb-3">
        <select name="myCity" id="myCity" class="form-control">
          <option value="">請選擇市區</option>
          <?php
          $city="select * from city where State=0";
          $city_rs = $link->query($city);
          while ($city_rows = $city_rs->fetch()){ ?>
            <option value="<?php echo $city_rows['AutoNo']; ?>"><?php echo $city_rows['Name']; ?></option>
          <?php } ?>
        </select><br>
        <select name="myTown" id="myTown" class="form-control">
          <option value="">請選擇地區</option>
        </select>
      </div>
      <label for="address" class="form-label" id="zipcode" name="zipcode">郵遞區號：地址</label>
      <div class="input-group mb-3">
        <input type="hidden" name="myZip" id="myZip" value="">
        <input type="text" name="address" id="address" class="form-control" placeholder="請輸入後續地址">
      </div>
      <label for="fileToUpload" class="form-label">上傳相片：</label>
      <div class="input-group mb-3">
        <input type="file" name="fileToUpload" id="fileToUpload" class="form-control" title="請上傳相片" accept="image/x-png,image/jpeg,image/gif,image/jpg"><br>
        <p><button type="button" class="btn btn-danger" id="uploadForm" name="uploadForm">開始上傳</button></p>
        <div id="progress-div01" class="progress" style="width: 100%;display:none;">
          <div id="progress-bar01" class="progress-bar progress-bar-striped" role="progressbar" style="width: 0%;"aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">50%</div>
        </div>


      <input type="hidden" name="uploadname" id="uploadname" value="" />
      <img src="" alt="photo" id="showimg" name="showimg" style="display:none;" class="img-fluid">
      </div>


      <div class="input-group mb-3">
        <input type="hidden" name="captcha" id="captcha" value="">
        <a href="javascript:void(0);" title="按我更新認證" onclick="getCaptcha();">
          <canvas id="can"></canvas>
        </a>
        <input type="text" name="recaptcha" id="recaptcha" class="form-control" placeholder="請輸入認證碼">
      </div>
      <input type="hidden" name="formctl" id="formctl" value="reg">
      <div class="input-group mb-3">
        <button type="submit" class="btn btn-success btn-lg">送出</button>
      </div>
    </form>
  </div>
 </div>
        </div>
      </div>
    </div>
  </section>
  <!-- 關於我們 -->
  <?php require_once("./html/aboutme.php") ?>

</body>
<!-- 外部js連結 -->
<?php require_once("./html/js.php") ?>
<!-- header網路素材 -->
<script src="./menu_hover_video.js"></script>


<script type="text/javascript" src="commlib.js"></script>
<script type="text/javascript" src="jquery.validate.js"></script>
<!-- 上傳圖片 驗證碼 郵遞區號 -->
<script type="text/javascript">
    // 取得元素ID
    function getId(el){
      return document.getElementById(el);
    }
    // 圖示上傳處理
    $("#uploadForm").click(function(e){
      var fileName = $('#fileToUpload').val();
      var idxDot = fileName.lastIndexOf(".") + 1;
      let extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
      if(extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == "gif"){
        $("#progress-div01").css("display", "flex");
        let file1 = getId("fileToUpload").files[0];
        let formdata = new FormData();
        formdata.append("file1", file1);
        let ajax = new XMLHttpRequest();
        ajax.upload.addEventListener("progress", progressHandler, false);
        ajax.addEventListener("load", completeHandler, false);
        ajax.addEventListener("error", errorHandler, false);
        ajax.addEventListener("abort", abortHandler, false);
        ajax.open("POST", "file_upload_parser.php");
        ajax.send(formdata);
        return false;
      }
      else {
          alert("目前只支援 jpg, jpeg, png, gif 檔案格式上傳!");
      }
    });
    // 上傳過程顯示百分比
    function progressHandler(event){
      let percent = Math.round((event.loaded / event.total) * 100);
      $("#progress-bar01").css("width", percent + "%");
      $("#progress-bar01").html(percent + "%");
    }
    // 上傳完成處理顯示圖片
    function completeHandler(event){
      let data = JSON.parse(event.target.responseText);
      if (data.success == 'true') {
          $("#uploadname").val(data.fileName);
          $("#showimg").attr({
              'src': 'uploads/' + data.fileName,
              'style': 'display:block;'
          });
          $('button.btn.btn-danger').attr({
              'style': 'display:none;'
          });
      } else {
          alert(data.error);
      }

    }
    function errorHandler(event){
      alert('上傳發生錯誤');
    }
    function abortHandler(event){
      alert('上傳作業取消');
    }

    // 認證碼
    function getCaptcha(){
      var inputTxt = document.getElementById("captcha");
      // can為canvas的id名稱
      // 150=影像寬 50=影像高 blue=影像背景顏色
      // white=文字顏色 28px=文字大小 5=認證碼長度
      inputTxt.value=captchaCode("can",150,50,"blue","white","28px",5);
    }
    $(function(){
      // 啟動認證碼功能
      getCaptcha();
      // 取得縣市代碼後查詢鄉鎮市名稱
      $("#myCity").change(function(){
        var CNo = $('#myCity').val();
        if(CNo == ""){
          return false;
        }
        $.ajax({
          // 將鄉鎮市的名稱從後台資料庫取出
          url:'Town_ajax.php',
          type:'post',
          dataType:'json',
          data:{
            CNo:CNo,
          },
          success:function(data){
            if(data.c==true){
              $('#myTown').html(data.m);
              $('#myZip').val("");
            }
            else{
              alert(data.m);
            }
          },
          error:function(data){
            alert("系統目前無法連接到後台資料庫");
          }
        });
      });
      // 取得鄉鎮市代碼 查詢郵遞區號放入#myZip,#zipcode
      $("#myTown").change(function(){
        var AutoNo =$('#myTown').val();
        if(AutoNo == ""){
          return false;
        }
        $.ajax({
          url:'Zip_ajax.php',
          type:'get',
          dataType:'json',
          data:{
            AutoNo:AutoNo,
          },
          success:function(data){
            if(data.c==true){
              $('#myZip').val(data.Post);
              $('#zipcode').html(data.Post + data.Cityname + data.Name);
            }
            else{
              alert(data.m);
            }
          },
          error:function(data){
            alert("系統目前無法連接到後台資料庫");
          }
        });
      });
    });
  </script>
  <!-- 表單驗證 -->
  <script type="text/javascript">
    // 表單驗證
    $('#reg').validate({
      rules:{
        email:{
          required:true,
          email:true,
          remote:"checkemail.php",
          },
          pw1:{
            required:true,
            maxlength:20,
            minlength:4,
          },
          pw2:{
            required:true,
            equalTo:"#pw1",
          },
          cname:{
            required:true,
          },
          tssn:{
            required:true,
            tssn:true,
          },
          brithday:{
            required:true,
          },
          mobile:{
            required:true,
            checkphone:true,
          },
          address:{
            required:true,
          },
          myTown:{
            checkMyTown:true,
          },
          recaptcha:{
            required:true,
            equalTo:"#captcha",
          },
      },
      messages:{
        email:{
          required:'  email不得為空',
          email:'  email格式錯誤',
          remote:'  email已註冊',
        },
        pw1:{
          required:' 密碼不得為空',
          maxlength:' 密碼最多20個字(4~20位英數組合字)',
          minlength:' 密碼最少4個字(4~20位英數組合字)',
        },
        pw2:{
          required:' 密碼不得為空',
          equalTo:' 密碼不一致',
        },
        cname:{
          required:' 使用者名稱不得為空',
        },
        tssn:{
          required:' 身分證字號不得為空',
          tssn:' 身分證字號格式錯誤',
        },
        brithday:{
          required:' 生日不得為空',
        },
        mobile:{
          required:' 手機號碼不得為空',
          checkphone:' 手機號碼格式錯誤',
        },
        address:{
          required:' 地址不得為空',
        },
        myTown:{
          checkMyTown:' 需選擇鄉鎮市區',
        },
        recaptcha:{
          required:' 請輸入認證碼',
          equalTo:' 認證碼錯誤',
        },
      },
    });
  </script>
  <!-- 自訂驗證規則 -->
  <script type="text/javascript">
    // 自訂驗證規則
    // 身分證格式驗證
    jQuery.validator.addMethod("tssn", function(value, element, param) {
      var tssn = /^[a-zA-Z]{1}[1-2]{1}[0-9]{8}$/;
      return this.optional(element) || (tssn.test(value));
    });

    // 手機號碼格式驗證
    jQuery.validator.addMethod("checkphone", function(value, element, param) {
      var checkphone = /^09\d{8}$/;
      return this.optional(element) || (checkphone.test(value));
    });

    // 鄉鎮市區驗證
    jQuery.validator.addMethod("checkMyTown", function(value,element,param){
      return(value != "");
    });
  </script>



</html>