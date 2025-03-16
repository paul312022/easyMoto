<section id="header" class="navbar_bgc">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php"><img src="./images/logo.png" class="img-fluid logo_navbar"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <?php
            //讀取購物車內的數量
            $SQLstring = "select * from cart where orderid is null and ip='" . $_SERVER['REMOTE_ADDR'] . "'";
            $cart_rs = $link->query($SQLstring);
            ?>
            <?php
            // 列出產品類別對應的第一層資料
            $SQLstring = "select * from pyclass where level=1 order by sort";
            $pyclass01 = $link->query($SQLstring);
            ?>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0 fw-bold">
                    <!-- <?php multiList01(); ?> -->
                    <li class="nav-item"><a class="nav-link" href="#">最新活動</a></li>
                    <li class="nav-item"><a class="nav-link" href="orderlist.php">查訂單</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">折價券</a></li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            企業專區
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">認識企業文化</a></li>
                            <li><a class="dropdown-item" href="#">全台門市資訊</a></li>
                            <li><a class="dropdown-item" href="#">供應商報價服務</a></li>
                            <li><a class="dropdown-item" href="#">加盟專區</a></li>
                            <li><a class="dropdown-item" href="#">投資人專區</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            會員中心
                        </a>
                        <ul class="dropdown-menu">
                        <?php if(isset($_SESSION['login'])){ ?>
                            <li><a class="dropdown-item" href="orderlist.php">我的訂單</a></li>
                            <li><a class="dropdown-item" href="profile.php">會員管理</a></li>
                        <li><a class="dropdown-item" href="javascript:void(0);" onclick="btn_confirmLink('是否確定登出','logout.php')">會員登出</a></li>
                        <?php } else{ ?>
                            <li><a class="dropdown-item" href="login.php">會員登入</a></li>
                            <li><a class="dropdown-item" href="register.php">會員註冊</a></li>
                            <?php } ?>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cart.php">
                            購物車
                            <span class="badge text-bg-back"><?php echo ($cart_rs) ? $cart_rs->rowCount() : ''; ?>
                            </span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>



    <?php
    // 顯示產品資訊內的內容顯示上navbar
    function multiList01()
    {
        global $link;
        // 列出產品類別對應的第一層資料
        $SQLstring = "select * from pyclass where level=1 order by sort";
        $pyclass01 = $link->query($SQLstring);
    ?>
        <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><?php echo $pyclass01_Rows['cname']; ?></a>
                <ul class="dropdown-menu">
                    <?php
                    // 列出產品類別對應的第二層資料
                    $SQLstring = sprintf("select * from pyclass where level=2 and uplink=%d order by sort", $pyclass01_Rows['classid']);
                    $pyclass02 = $link->query($SQLstring);
                    // 將sql搜到的內容放在pyclass02變數裡
                    ?>
                    <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                        <li><a class="dropdown-item" href="drugstore.php?classid=<?php echo $pyclass02_Rows['classid'] ?>">
                                <em class="fas <?php echo $pyclass02_Rows['fonticon']; ?> fa-fw"></em><?php echo $pyclass02_Rows['cname'] ?>
                            </a></li>
                    <?php } ?>
                </ul>
            </li>
        <?php } ?>
    <?php } ?>
</section>