<div class="card mb-3">
    <div class="row g-0">
        <div class="col-md-4">
            <?php
            // 取得產品圖片檔名資料
            $SQLstring = sprintf("select * from product_img where product_img.p_id=%d order by sort", $_GET['p_id']);
            $img_rs = $link->query($SQLstring);
            $imgList = $img_rs->fetch();
            ?>
            <img id="showGoods" name="showGoods" class="img-fluid rounded-start" src="product_img/<?php echo $imgList['img_file']; ?>" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>">

            <div class="row mt-2">
                <?php do { ?>
                    <div class="col-md-4 smail_img_to_big_img">
                        <a class="fancybox" rel="group" href="./product_img/<?php echo $imgList['img_file']; ?>" title="<?php echo $data['p_name']; ?>">
                            <img src="product_img/<?php echo $imgList['img_file']; ?>" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>" class="img-fluid">
                        </a>
                    </div>
                <?php } while ($imgList = $img_rs->fetch()); ?>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h5 class="card-title"><?php echo $data['p_name']; ?></h5>
                <p class="card-text"><?php echo $data['p_intro']; ?></p>
                <h4 class="color_c50000">NT <?php echo $data['p_price']; ?></h4>
                <div class="row mt-3">
                    <div class="col-md-4">
                        <div class="input-group  input-group-lg">
                            <span class="input-group-text color-success" id="inputGroup-sizing-lg">尺寸</span>
                            <select id="size" name="size" class="form-control" aria-label="Sizing example select" aria-describedby="inputGroup-sizing-lg">
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                                <option value="2XL">2XL</option>
                            </select>
                        </div>
                        <div class="input-group input-group-lg movetop5">
                            <span class="input-group-text color-success" id="inputGroup-sizing-lg">數量</span>
                            <input type="number" id="qty" name="qty" value="1" min="1" max="2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                        </div>
                        <p class="show_buy_inf">限購2件商品</p>
                    </div>
                    <div class="col-md-4">
                        <button id="buttom01" name="button01" type="button" class="btn btn-success btn-lg color-success" onclick="addcart(<?php echo $data['p_id']; ?>)">加入購物車</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="" style="background-color: white;"><?php echo $data['p_content']; ?></div>