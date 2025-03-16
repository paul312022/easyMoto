<?php
//建立購物車資料查詢
$SQLstring = "select * from cart,product,product_img where ip='" . $_SERVER['REMOTE_ADDR'] . "'and orderid is null and cart.p_id=product_img.p_id and cart.p_id=product.p_id and product_img.sort=1 order by cartid desc";
$cart_rs = $link->query($SQLstring);
$ptotal = 0; //設定累加的變數
?>
<h3 class="color_c50000">購物車</h3>
<?php if ($cart_rs->rowCount() != 0) { ?>
    <a href="product.php" id="btn01" name="btn01" class="btn btn-light">繼續購物</a>
    <button type="button" id="btn02" name="btn02" class="btn btn-light" onclick="window.history.go(-1)">回上一頁</button>
    <button type="button" id="btn03" name="btn03" class="btn btn-light" onclick="btn_confirmLink('確定清空購物車?','shopcart_del.php?mode=2');">清空購物車</button>
    <a href="checkout.php" class="btn btn-light">前往結帳</a>
    <div class="table-responsive-md web_bgc">
        <table class="table table-hover mt-3">
            <thead>
                <tr class="table-dark">
                    <td width="10%">產品編號</td>
                    <td width="10%">圖片</td>
                    <td width="25%">名稱</td>
                    <td width="10%">價格</td>
                    <td width="10%">尺寸</td>
                    <td width="10%">數量</td>
                    <td width="15%">小計</td>
                    <td width="10%">下次再買</td>
                </tr>
            </thead>
            <tbody>
                <?php while ($cart_data = $cart_rs->fetch()) { ?>
                    <tr>
                        <td><?php echo $cart_data['p_id']; ?></td>
                        <td>
                            <img class="img-fluid" src="./product_img/<?php echo $cart_data['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>">
                        </td>
                        <td><?php echo $cart_data['p_name']; ?></td>
                        <td>
                            <h4 class="pt-1"><?php echo $cart_data['p_price']; ?></h4>
                        </td>
                        <td style="min-width: 100px;">
    <select class="form-select p_size" cartid="<?php echo $cart_data['cartid']; ?>">
        <option value="">請選擇尺寸</option>
        <option value="S" <?php echo ($cart_data['p_size'] == "S") ? "selected" : ""; ?>>S</option>
        <option value="M" <?php echo ($cart_data['p_size'] == "M") ? "selected" : ""; ?>>M</option>
        <option value="L" <?php echo ($cart_data['p_size'] == "L") ? "selected" : ""; ?>>L</option>
        <option value="XL" <?php echo ($cart_data['p_size'] == "XL") ? "selected" : ""; ?>>XL</option>
        <option value="2XL" <?php echo ($cart_data['p_size'] == "2XL") ? "selected" : ""; ?>>2XL</option>
    </select>
</td>

                        <td style="min-width: 100px;">
                            <div class="input-group">
                                <input type="number" class="form-control" id="qty[]" name="qty[]" value="<?php echo $cart_data['qty']; ?>" min="1" max="2" cartid="<?php echo $cart_data['cartid']; ?>" required style="min-width:60px;">
                            </div>
                        </td>
                        <td>
                            <div class="color_c50000">$<?php echo $cart_data['p_price'] * $cart_data['qty']; ?></div>
                        </td>
                        <td>
                            <button type="button" id="btn[]" name="btn[]" class="btn btn-danger" onclick="btn_confirmLink('確定刪除本訂單?','shopcart_del.php?mode=1&cartid=<?php echo $cart_data['cartid']; ?>')">取消</button>
                        </td>
                    </tr>
                <?php $ptotal += $cart_data['p_price'] * $cart_data['qty'];
                } ?>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="8">累計:<?php echo $ptotal; ?></td>
                </tr>
                <tr>
                    <td colspan="8">運費:100</td>
                </tr>
                <tr>
                    <td colspan="8" class="color_red">總計:<?php echo $ptotal + 100; ?></td>
                </tr>
            </tfoot>
        </table>
    </div>
<?php } else { ?>
    <div class="alert alert-warning" role="alert">目前購物車為空</div>
<?php } ?>