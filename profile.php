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

    <div id="carouselExampleControls" class="carousel row slide mx-auto" data-bs-ride="carousel">
      <div class="col-12 col-lg-2">
        <!-- 左側sidebar分類導覽 -->
        <?php require_once("./html/sidebar.php") ?>
        <!-- 熱銷商品區 -->
        <?php require_once("./html/hot.php") ?>
      </div>
      <div class="col-12 col-lg-10">
<!-- ***引入會員資料修改模組*** -->
<?php require_once("./html/profile_content.php") ?>
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
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script type="text/javascript">
    const Vue3 = Vue.createApp({
      data() {
        return {
          emailid: <?php echo $_SESSION['emailid']; ?>, //取得會員emailid
          member: [], //會員資料更新陣列
          captcha: '', //存認證碼變數
          readonly: true, //資料的讀取模式或是編輯魔術
          PWOld: '', //密碼更改存舊密碼變數
          PWNew1: '', //密碼更改存新密碼變數1
          PWNew2: '', //密碼更改存新密碼變數2
        }
      },
      methods: {
        //儲存修改後的密碼至後台資料庫
        async savePW() {
          let valid = $('#changePW').valid();
          if (valid) {
            await axios.get('reqchangePW.php', {
                params: {
                  emailid: this.member.emailid,
                  PWNew1: MD5(this.PWNew1),
                }
              })
              .then((res) => {
                let data = res.data;
                if (data.c == true) {
                  $('#changePW').validate().resetForm();
                  this.PWOld = '';
                  this.PWNew1 = '',
                  this.PWNew2 = '',
                  $('#mClose').click();
                  alert(data.m);
                }
              })
              .catch(function(error) {
                alert(error);
              });
          }
        },
        // 存修改後的會員資料至後台資料庫
        async saveMember() {
          let valid = $('#reg').valid(); //呼叫資料驗證函數

          if (valid) {
            let imgfile = $('#uploadname').val();
            if (imgfile != '') {
              this.member.imgname = imgfile;
            }
            await axios.get('reqMember.php', {
                params: {
                  cname: this.member.cname,
                  emailid: this.member.emailid,
                  imgname: this.member.imgname,
                  tssn: this.member.tssn,
                  birthday: this.member.birthday,
                }
              })
              .then((res) => {
                let data = res.data;
                if (data.c == true) {
                  alert(data.m);
                  location.reload();
                }
              })
              .catch(function(error) {
                alert(error);
              });
          }
        },
        // 開啟編輯會員資料模式
        editMember() {
          this.readonly = false;
        },
        // 使用第三方AJAX的API 取得使用者資料
        getMemberInfo() {
          axios.get('memberinfo.php', {
              params: {
                emailid: this.emailid,
              }
            })
            .then((res) => {
              let data = res.data;
              if (data.c == true) {
                this.member = data.d[0];
              } else {
                alert(data.m);
              }
            })
            .catch(function(error) {
              alert("系統目前無法連接到後台資料庫");
            });
        },
        getCaptcha() {
          // 認證碼
          // can為canvas的id名稱
          // 150=影像寬 50=影像高 blue=影像背景顏色
          // white=文字顏色 28px=文字大小 5=認證碼長度
          this.captcha = captchaCode("can", 150, 50, "blue", "white", "28px", 5);
        }
      },
      mounted() {
        this.getCaptcha();
        this.getMemberInfo();
      }
    });
    Vue3.mount("#modify");
    $(function() {
      // 身分證格式驗證
      jQuery.validator.addMethod("tssn", function(value, element, param) {
        var tssn = /^[a-zA-Z]{1}[1-2]{1}[0-9]{8}$/;
        return this.optional(element) || (tssn.test(value));
      });

      // 驗證form #reg表單
      $('#reg').validate({
        onfocusout: false,
        rules: {
          cname: {
            required: true,
          },
          tssn: {
            required: true,
            tssn: true,
          },
          brithday: {
            required: true,
          },
          recaptcha: {
            required: true,
            equalTo: "#captcha",
          },
        },
        messages: {
          cname: {
            required: ' 使用者名稱不得為空',
          },
          tssn: {
            required: ' 身分證字號不得為空',
            tssn: ' 身分證字號格式錯誤',
          },
          brithday: {
            required: ' 生日不得為空',
          },
          recaptcha: {
            required: ' 請輸入認證碼',
            equalTo: ' 認證碼錯誤',
          },
        },
      });
      //驗證changePW變更密碼表單
      $('#changePW').validate({
        rules: {
          PWOld: {
            required: true,
            remote: 'checkPW.php?emailid=<?php echo $_SESSION['emailid'] ?>',
          },
          PWNew1: {
            required: true,
            maxlength: 20,
            minlength: 4,
          },
          PWNew2: {
            required: true,
            equalTo: '#PWNew1',
          },
        },
        messages: {
          PWOld: {
            ruquired: '原始密碼不得為空白',
            remote: '輸入錯誤',
          },
          PWNew1: {
            required: '新密碼不得為空白',
            maxlength: '密碼最多為20字',
            minlength: '密碼最少為4字',
          },
          PWNew2: {
            required: '確認密碼不得為空白',
            equalTo: '確認密碼與新密碼不同',
          },
        },

      })
    });

    // 取得元素ID
    function getId(el) {
      return document.getElementById(el);
    }
    // 圖示上傳處理
    $("#uploadForm").click(function(e) {
      var fileName = $('#fileToUpload').val();
      var idxDot = fileName.lastIndexOf(".") + 1;
      let extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
      if (extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == "gif") {
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
      } else {
        alert("目前只支援 jpg, jpeg, png, gif 檔案格式上傳!");
      }
    });
    // 上傳過程顯示百分比
    function progressHandler(event) {
      let percent = Math.round((event.loaded / event.total) * 100);
      $("#progress-bar01").css("width", percent + "%");
      $("#progress-bar01").html(percent + "%");
    }
    // 上傳完成處理顯示圖片
    function completeHandler(event) {
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

    function errorHandler(event) {
      alert('上傳發生錯誤');
    }

    function abortHandler(event) {
      alert('上傳作業取消');
    }
  </script>



</html>