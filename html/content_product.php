<?php
// 每頁顯示的產品數量
$maxRows_rs = 15;
$pageNum_rs = 0;

if (isset($_GET['pageNum_rs'])) {
    $pageNum_rs = $_GET['pageNum_rs'];
}

$startRow_rs = $pageNum_rs * $maxRows_rs;

if(isset($_GET['search_name'])){
    //搜尋列查詢
    $queryFirst=sprintf("select * from product,product_img,pyclass where p_open=1 and product_img.sort=1 and product.p_id=product_img.p_id and product.classid=pyclass.classid and product.p_name like '%s' order by product.p_id desc",'%'.$_GET['search_name'].'%');
}
// 根據 classid 處理查詢條件
elseif (isset($_GET['classid'])) {
    $classid = $_GET['classid'];
    if (is_numeric($classid)) {
        if (strlen($classid) === 1) {
            // 若 classid 為單一數字，模糊查詢以該數字開頭的所有產品
            $queryFirst = sprintf(
                "SELECT * FROM product, product_img 
                 WHERE p_open=1 
                   AND product_img.sort=1 
                   AND product.p_id=product_img.p_id 
                   AND product.classid LIKE '%s%%' 
                 ORDER BY product.p_id DESC", 
                $classid
            );
        } else {
            // 若 classid 為多位數，進行精確查詢
            $queryFirst = sprintf(
                "SELECT * FROM product, product_img 
                 WHERE p_open=1 
                   AND product_img.sort=1 
                   AND product.p_id=product_img.p_id 
                   AND product.classid='%d' 
                 ORDER BY product.p_id DESC", 
                $classid
            );
        }
    } else {
        // 如果 classid 非數字，預設查詢所有產品（可選擇擋下非法輸入）
        $queryFirst = "SELECT * FROM product, product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id ORDER BY product.p_id DESC";
    }
} else {
    // 若無 classid，查詢所有產品
    $queryFirst = "SELECT * FROM product, product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id ORDER BY product.p_id DESC";
}

$query = sprintf("%s limit %d,%d", $queryFirst, $startRow_rs, $maxRows_rs);
$pList01 = $link->query($query);
$i = 1;
?>
<!-- 產品區 -->
<div class="container">
    <?php if($pList01->rowCount()!=0){ ?>
    <?php while ($pList01_Rows = $pList01->fetch()) { ?>
        <?php if ($i % 5 == 1) { ?>
            <div class="row align-items-start text-start mb-3">
        <?php } ?>
            <div class="card mx-2 mb-3 card_width">
            <a href="goods.php?p_id=<?php echo $pList01_Rows['p_id']; ?>">
                <img src="./product_img/<?php echo $pList01_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList01_Rows['p_name']; ?>" title="<?php echo $pList01_Rows['p_name']; ?>">
            </a>
                <div class="card-body">
                    <h5 class="card-title"><?php echo $pList01_Rows['p_name']; ?></h5>
                    <p class="card-text"><?php echo mb_substr($pList01_Rows['p_intro'], 0, 30, "utf-8"); ?></p>
                    <p class="card-text">NT<?php echo $pList01_Rows['p_price']; ?></p>
                    <div class="row">
                        <a href="goods.php?p_id=<?php echo $pList01_Rows['p_id']; ?>" class="btn btn-danger">更多資訊</a>
                    </div>
                </div>
            </div>
        <?php if ($i % 5 == 0 || $i == $pList01->rowCount()) { ?>
            </div>
        <?php } ?>
    <?php $i++;
    } ?>
</div>

<!-- 頁碼 -->
<div class="row mt-4">
    <?php //取得目前頁數
    if (isset($_GET['totalRows_rs'])) {
        $totalRows_rs = $_GET['totalRows_rs'];
    } else {
        $all_rs = $link->query($queryFirst);
        $totalRows_rs = $all_rs->rowCount();
    }
    $totalRows_rs = ceil($totalRows_rs / $maxRows_rs) - 1;
    //呼叫分頁功能函數
    $prev_rs = "&laquo;";
    $next_rs = "&raquo;";
    $separator = "|";
    $max_links = 20;
    $pages_rs = buildNavigation($pageNum_rs, $totalRows_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "rs");
    ?>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
        </ul>
    </nav>
</div>
<?php } else { ?>
    <div class="alert alert-danger" role="alert">
      目前尚未有相關產品
    </div>
<?php } ?>