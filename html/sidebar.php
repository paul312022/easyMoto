<div class="sidebar mb-2" style="border: 5px solid #dc3545; border-radius: 5px;">
    <form name="search" class="bg-danger" id="search" action="product.php" method="get">
        <div class="input-group">
        <input type="text" name="search_name" id="search_name" class="form-control" placeholder="搜尋..." value="<?php echo(isset($_GET['search_name']))?$_GET['search_name']:''; ?>" required>
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                    <i class="fas fa-search fa-lg"></i>
                </button>
            </span>
        </div>
    </form>
</div>
<?php
// 列出產品類別對應的第一層資料
$SQLstring = "select * from pyclass where level=1 order by sort";
$pyclass01 = $link->query($SQLstring);
$i = 1; //控制編號順序 用來排版
?>
<!-- 左方下拉選單 -->
<div class="accordion" id="accordionExample">
    <?php while ($pyclass01_Rows = $pyclass01->fetch()) { $i=$pyclass01_Rows['classid']; ?>
        <!-- 迴圈設定:fetch()會從資料庫抓取質給$pyclass01 若沒有資料可以抓時 就會返回false -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne<?php echo $i ?>">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<?php echo $i ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $i ?>">
                    <i class="fas <?php echo $pyclass01_Rows['fonticon']; ?> fa-lg fa-fw"></i><?php echo $pyclass01_Rows['cname']; ?>
                </button>
            </h2>
            <?php
            if (isset($_GET['p_id'])) {
                $SQLstring = sprintf("select uplink from pyclass,product where pyclass.classid=product.classid and p_id=%d",$_GET['p_id']);
                $classid_rs=$link->query($SQLstring);
                $data=$classid_rs->fetch();
                $ladder=$data['uplink'];
            }
            elseif (isset($_GET['level']) && $_GET['level'] == 1){
                $ladder = $_GET['classid'];
            }
            elseif (isset($_GET['classid'])){
                //使用類別查詢 取得上ㄧ層類別
                $SQLstring="select uplink from pyclass where level=2 and classid=" . $_GET['classid'];
                $classid_rs=$link->query($SQLstring);
                $data=$classid_rs->fetch();
                $ladder=$data['uplink'];
            }
            else{
                $ladder=1;
            }
            // 列出產品類別對應的第二層資料
            $SQLstring = sprintf("select * from pyclass where level=2 and uplink=%d order by sort", $pyclass01_Rows['classid']);
            $pyclass02 = $link->query($SQLstring);
            // 將sql搜到的內容放在pyclass02變數裡
            ?>
            <div id="collapseOne<?php echo $i ?>" class="accordion-collapse  text-dark collapse <?php echo ($i == $ladder) ? 'show' : ''; ?>" aria-labelledby="headingOne<?php echo $i ?>" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <table class="table">
                        <tbody>
                            <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                <tr>
                                    <!-- 顯示pyclass02變數裡的資訊內容 -->
                                    <td><a href="product.php?classid=<?php echo $pyclass02_Rows['classid']  ?>"class=" text-dark d-block"><em class="fas <?php echo $pyclass02_Rows['fonticon']; ?> fa-fw"></em><?php echo $pyclass02_Rows['cname'] ?></a></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    <?php $i++;
    } ?>
</div>