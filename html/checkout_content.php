<?php
          // 取得收件者地址資料
          $SQLstring = sprintf("select * ,city.Name as ctName,town.Name as toName from addbook,city,town where emailid ='%d' and setdefault='1' and addbook.myzip=town.Post and town.AutoNo=city.AutoNo", $_SESSION['emailid']);
          $addbook_rs = $link->query($SQLstring);
          if ($addbook_rs && $addbook_rs->rowCount() != 0) {
            $data = $addbook_rs->fetch();
            $cname = $data['cname'];
            $mobile = $data['mobile'];
            $myzip = $data['myzip'];
            $address = $data['address'];
            $ctName = $data['ctName'];
            $toName = $data['toName'];
          } else {
            $cname = "";
            $mobile = "";
            $myzip = "";
            $address = "";
            $ctName = "";
            $toName = "";
          }
          ?>
          <h3 class="color_c50000">會員：<?php echo $_SESSION['cname']; ?><br>結帳作業</h3>
          <div class="row">
            <!-- 配送資訊 -->
            <div class="card col-5 ms-3">
              <div class="card-header bg-dark text-white">
                <i class="fas fa-truck fa-flip-horizontal me-1"></i>配送資訊
              </div>
              <div class="card-body">
                <h4 class="card-title">收件人資訊：</h4>
                <h5 class="card-title">姓名：<?php echo $cname; ?></h5>
                <p class="card-text">電話：<?php echo $mobile; ?></p>
                <p class="card-text">郵遞區號：<?php echo $myzip . $ctName . $toName; ?></p>
                <p class="card-text">地址：<?php echo $address; ?></p>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">選擇其他收件人</button>
              </div>
            </div>
            <!-- 付款方式 -->
            <div class="card col-6 ms-3">
              <div class="card-header bg-dark text-white">
                <i class="fas fa-credit-card me-1"></i>付款方式
              </div>
              <div class="card-body">
                <!-- 付款類別 -->
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true" style="color: #c50000 !important;font-size:14pt; font-weight:bolder;">貨到付款</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false" style="color: #c50000 !important;font-size:14pt; font-weight:bolder;">信用卡</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false" style="color: #c50000 !important;font-size:14pt; font-weight:bolder;">銀行轉帳</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="epay-tab" data-bs-toggle="tab" data-bs-target="#epay" type="button" role="tab" aria-controls="epay" aria-selected="false" style="color: #c50000 !important;font-size:14pt; font-weight:bolder;">電子支付</button>
                  </li>
                </ul>
                <!-- 付款類別內容 -->
                <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                    <h5 class="card-title mt-3">收件人資訊：</h5>
                    <h5 class="card-title">姓名：<?php echo $cname; ?></h5>
                    <p class="card-text">電話：<?php echo $mobile; ?></p>
                    <p class="card-text">郵遞區號：<?php echo $myzip . $ctName . $toName; ?></p>
                    <p class="card-text">地址：<?php echo $address; ?></p>
                  </div>
                  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                    <table class="table caption-top">
                      <caption>選擇付款帳戶</caption>
                      <thead>
                        <tr>
                          <th scope="col" width="5%">#</th>
                          <th scope="col" width="5%">信用卡系統</th>
                          <th scope="col" width="5%">發卡銀行</th>
                          <th scope="col" width="5%">信用卡卡號</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row"><input type="radio" name="creditCard" id="creditCard[]" checked></th>
                          <td><img src="images/Visa_Inc._logo.svg" alt="visa" class="img-fluid"></td>
                          <td>玉山商業銀行</td>
                          <td>1234 ****</td>
                        </tr>
                        <tr>
                          <th scope="row"><input type="radio" name="creditCard" id="creditCard[]"></th>
                          <td><img src="images/MasterCard_Logo.svg" alt="master" class="img-fluid"></td>
                          <td>玉山商業銀行</td>
                          <td>1234 ****</td>
                        </tr>
                        <tr>
                          <th scope="row"><input type="radio" name="creditCard" id="creditCard[]"></th>
                          <td><img src="images/UnionPay_Logo.svg" alt="unionpay" class="img-fluid"></td>
                          <td>玉山商業銀行</td>
                          <td>1234 ****</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                    <h4 class="card-title pt-3">ATM匯款資訊：</h4>
                    <img src="images/Cathay-bk-rgb-db.svg" alt="cathay" class="img-fluid">
                    <h5 class="card-title mt-3">匯款銀行：國泰世華銀行 銀行代碼：013</h5>
                    <h5 class="card-title">姓名：李小明</h5>
                    <p class="card-text">匯款帳號：1234-4567-7890-1234</p>
                    <p class="card-text">備註：匯款完成後，需要1、2個工作天，待系統入款完成後，將以簡訊通知訂單完成付款。</p>
                  </div>
                  <div class="tab-pane fade" id="epay" role="tabpanel" aria-labelledby="epay-tab" tabindex="0">
                    <table class="table caption-top">
                      <caption>選擇付款帳戶</caption>
                      <thead>
                        <tr>
                          <th scope="col" width="5%">#</th>
                          <th scope="col" width="35%">電子支付系統</th>
                          <th scope="col" width="60%">電子支付系統</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row"><input type="radio" name="epay[]" id="epay[]" checked></th>
                          <td><img src="images/Apple_Pay_logo.svg" alt="applepay" class="img-fluid"></td>
                          <td>Apple Pay</td>
                        </tr>
                        <tr>
                          <th scope="row"><input type="radio" name="epay[]" id="epay[]"></th>
                          <td><img src="images/Line_pay_logo.svg" alt="Linepay" class="img-fluid"></td>
                          <td>Line Pay</td>
                        </tr>
                        <tr>
                          <th scope="row"><input type="radio" name="epay[]" id="epay[]"></th>
                          <td><img src="images/JKOPAY_logo.svg" alt="jkopay" class="img-fluid"></td>
                          <td>街口支付</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <?php
          // 建立購物車內容查詢
          $SQLstring = sprintf("select * from cart,product,product_img where ip='" . $_SERVER['REMOTE_ADDR'] . "' and orderid is null and cart.p_id=product_img.p_id and cart.p_id=product.p_id and product_img.sort=1 order by cartid desc");
          $cart_rs = $link->query($SQLstring);
          $ptotal = 0; //設定累加變數
          ?>
          <div class="table-responsive-md col-11">
            <table class="table mt-3 table-hover web_bgc">
              <thead>
                <tr class="table-dark">
                  <td width="10%">產品編號</td>
                  <td width="10%">圖片</td>
                  <td width="25%">名稱</td>
                  <td width="10%">價格</td>
                  <td width="10%">尺寸</td>
                  <td width="10%">數量</td>
                  <td width="15%">小計</td>
                </tr>
              </thead>
              <tbody>
                <?php while ($cart_data = $cart_rs->fetch()) { ?>
                  <tr>
                    <td>
                      <?php echo $cart_data['p_id']; ?>
                    </td>
                    <td>
                      <img class="img-fluid" src="./product_img/<?php echo $cart_data['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>">
                    </td>
                    <td>
                      <?php echo $cart_data['p_name']; ?>
                    </td>
                    <td>
                      <h4 class="color_c50000 pt-1">$<?php echo $cart_data['p_price']; ?></h4>
                    </td>
                    <td>
                      <?php echo $cart_data['p_size']; ?>
                    </td>
                    <td>
                      <?php echo $cart_data['qty']; ?>
                    </td>
                    <td>
                      <h4 class="color_c50000 pt-1">$<?php echo $cart_data['p_price'] * $cart_data['qty']; ?></h4>
                    </td>
                  </tr>
                  <?php $ptotal += $cart_data['p_price'] * $cart_data['qty']; ?>
                  <?php } ?>
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="7">累計:<?php echo $ptotal; ?></td>
                </tr>
                <tr>
                  <td colspan="7">運費:100</td>
                </tr>
                <tr>
                  <td colspan="7" class="color_red">總計:<?php echo $ptotal + 100; ?></td>
                </tr>
                <tr>
                  <td colspan="7">
                    <button type="button" id="btn04" name="btn04" class="btn btn-danger"><i class="fas fa-cart-arrow-down pr-2"></i>確認結帳</button>
                    <button type="button" id="btn05" name="btn05" class="btn btn-dark mr-2" onclick="window.history.go(-1);"><i class="fa-solid fa-arrow-rotate-left pr-2"></i>回上一頁</button>
                  </td>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>