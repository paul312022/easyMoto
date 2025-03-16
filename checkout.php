<?php
//載入共用php函數庫
require_once("php_lib.php");

// 確保編碼設置
header('Content-Type: text/html; charset=utf-8');

//如果session沒有啟動 則啟動session功能 這是跨網頁變數存取
(!isset($_SESSION)) ? session_start() : "";

//這是將資料庫 連線程式載入
require_once('./connections/conn_db.php');

// 強制使用者登入
if (!isset($_SESSION['login'])) {
  $sPath = "login.php?sPath=checkout";
  header(sprintf("Location: %s", $sPath));
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
  <style type="text/css">
    .table td,
    .table th {
      padding: .75rem;
      vertical-align: top;
      border-bottom: none;
      border-top: 1px solid #dee2e6;
    }

    .table th {
      font-weight: normal;
      color: #6c757d;
      text-align: left;
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
        <!-- ***引入結帳模組*** -->
        <?php require_once("./html/checkout_content.php") ?>
      </div>
    </div>
  </section>
  <!-- 關於我們 -->
  <?php require_once("./html/aboutme.php") ?>

  <!-- modal收件人地址處理對話框 -->
  <?php
  //  收得所有人資料
  $SQLstring = sprintf("select *,city.Name as ctName,town.Name as toName from addbook,city,town where emailid='%d' and addbook.myzip=town.Post and town.AutoNo=city.AutoNo", $_SESSION['emailid']);
  $addbook_rs = $link->query($SQLstring);
  ?>
  <!-- 選擇其他收件人 -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">收件人資訊</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form>
            <div class="row">
              <div class="col">
                <input type="text" name="cname" id="cname" class="form-control" placeholder="收件人姓名">
              </div>
              <div class="col">
                <input type="text" name="mobile" id="mobile" class="form-control" placeholder="收件人電話">
              </div>
              <div class="col">
                <select name="myCity" id="myCity" class="form-control">
                  <option value="">請選擇縣市</option>
                  <?php
                  $city = "select * from `city` where State=0";
                  $city_rs = $link->query($city);
                  while ($city_rows = $city_rs->fetch()) {
                  ?>
                    <option value="<?php echo $city_rows['AutoNo'] ?>"><?php echo $city_rows['Name']; ?></option>
                  <?php
                  }
                  ?>
                </select>
              </div>
              <div class="col">
                <select name="myTown" id="myTown" class="form-control">
                  <option value="">請選擇地區</option>
                </select>
              </div>
            </div>
            <div class="row mt-3">
              <div class="col">
                <input type="hidden" name="myZip" id="myZip" value="">
                <label for="address" id="add_label" name="add_label">郵遞區號：</label>
                <input type="text" name="address" id="address" class="form-control">
              </div>
            </div>
            <div class="row mt-4 justify-content-center">
              <div class="col-auto">
                <button type="button" class="btn btn-primary" id="recipient" name="recipient">新增收件人</button>
              </div>
            </div>
        </div>
        </form>
        <hr>
        <table class="table">
          <thead class="table-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">收件人姓名</th>
              <th scope="col">電話</th>
              <th scope="col">地址</th>
            </tr>
          </thead>
          <tbody>
            <?php while ($data = $addbook_rs->fetch()) { ?>
              <tr>
                <th scope="row">
                  <input type="radio" name="gridRadios" id="gridRadios[]" value="<?php echo $data['addressid'] ?>" <?php echo ($data['setdefault']) ? 'checked' : ''; ?>>
                </th>
                <td><?php echo $data['cname']; ?></td>
                <td><?php echo $data['mobile']; ?></td>
                <td><?php echo $data['myzip'] . $data['ctName'] . $data['toName'] . $data['address']; ?></td>
              </tr>
            <?php } ?>
          </tbody>
        </table>
        <div class="modal-footer justify-content-center">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 載入畫面 -->
  <div id="loading" name="loading" style="display:none;position:fixed;width:100%;height:100%;top:0;left:0;background-color:rgba(255,255,255,0.5);z-index:9999;"><i class="fas fa-spinner fa-spin fa-5x fa-fw" style="position: absolute;top:50%;left:50%"></i></div>

</body>
<!-- 外部js連結 -->
<?php require_once("./html/js.php") ?>
<!-- header網路素材 -->
<script src="./menu_hover_video.js"></script>
<!-- 縣市鄉鎮市代碼查詢 -->
<script type="text/javascript">
  $(function() {
    //取得縣市代碼後查詢鄉鎮名稱
    $("#myCity").change(function() {
      var CNo = $("#myCity").val();
      if (CNo == "") {
        return false;
      }
      $('#myZip').val('');
      $('#add_label').html('郵遞區號：');
      $.ajax({
        //將縣市代碼從資料庫取回
        url: 'Town_ajax.php',
        type: 'post',
        dataType: 'json',
        data: {
          CNo: CNo,
        },
        success: function(data) {
          if (data.c == true) {
            $("#myTown").html(data.m);
          } else {
            alert("Database response error" + data.m);
          }
        },
        error: function(data) {
          alert("系統目前無法連接到後台資料庫");
        }
      });
    });
    // 取得鄉鎮市代碼 查詢郵遞區號放入#myZip #zipcode
    $("#myTown").change(function() {
      var AutoNo = $("#myTown").val();
      if (AutoNo == "") {
        $("#myZip").val("");
        $("#add_label").html("");
        return false;
      }
      $.ajax({
        url: 'Zip_ajax.php',
        type: 'get',
        dataType: 'json',
        data: {
          AutoNo: AutoNo,
        },
        success: function(data) {
          if (data.c == true) {
            $('#myZip').val(data.Post);
            $('#add_label').html('郵遞區號：' + data.Post + data.Cityname + data.Name);
          } else {
            alert("Database response error:" + data.m);
          }
        },
        error: function(data) {
          alert("系統目前無法連接到後台資料庫");
        }
      });
    });
  });
</script>
<!-- 新增收件人 -->
<script type="text/javascript">
  $(function(){
    // 新增收件人
    $("#recipient").click(function(){
      var validate = 0;
        msg = "";
      var cname = $("#cname").val();
      var mobile = $("#mobile").val();
      var myZip = $("#myZip").val();
      var address = $("#address").val();
      var checkphone = /^09{1}[0-9]{8}$/;
      if(cname == ""){
        msg = msg + "收件人不得為空;\n";
        validate = 1;
      }
      if(mobile == ""){
        msg = msg + "收件人電話不得為空;\n";
        validate = 1;
      }
      if(checkphone.test(mobile)==false){
        msg = msg + "收件人電話格式錯誤;\n";
        validate = 1;
      }
      if(myZip == ""){
        msg = msg + "郵遞區號不得為空;\n";
        validate = 1;
      }
      if(address == ""){
        msg = msg + "收件人地址不得為空;\n";
        validate = 1;
      }
      if(validate){
        alert(msg);
        return false;
      }
      // 寫入資料庫
      $.ajax({
        url:'addbook.php',
        type:'post',
        dataType:'json',
        data:{
          cname:cname,
          mobile:mobile,
          myZip:myZip,
          address:address,
        },
        success:function(data){
          if(data.c == true){
            alert(data.m);
            window.location.reload();
          }
          else{
            alert("Database response error:" + data.m);
          }
        },
        error:function(data){
          alert("系統目前無法連接到後台資料庫");
        }
      });
    });
    // 更換收件人
    $('input[name=gridRadios]').change(function(){
      var addressid = $(this).val();
      $.ajax({
        url:'changeadd.php',
        type:'post',
        dataType:'json',
        data:{
          addressid:addressid,
        },
        success:function(data){
          if(data.c == true){
            alert(data.m);
            window.location.reload();
          }
          else{
            alert("Database reponse error:"+data.m);
          }
        },
        error:function(data){
          alert("ajax request error");
        }
      });
    });
    // 結帳處理
    $('#btn04').click(function(){
      let msg = "系統將進行結帳處裡，請確認產品資訊與收件人是否正確！";
      if(!confirm(msg)) return false;
      $("#loading").show();
      var addressid = $('input[name=gridRadios]:checked').val();
      $.ajax({
        url:'addorder.php',
        type:'post',
        dataType:'json',
        data:{
          addressid:addressid,
        },
        success:function(data){
          if(data.c == true){
            alert(data.m);
            window.location.href = "index.php";
          }
          else{
            alert("Database reponse error:" + data.m);
          }
        },
        error:function(data){
          alert("ajax request error");
        }
      });
    });
  });
</script>


</html>