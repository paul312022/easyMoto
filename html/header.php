<section id="header">
    <div class="video-background">
        <?php
        // 取得當前檔案名稱
        $current_page = basename($_SERVER['PHP_SELF']);

        // 定義兩段不同的 HTML
        $header_for_index = <<<HTML

        <video src="/images/index_video.mp4" id="video-background" muted autoplay loop></video>
        

HTML;

        $header_for_others = <<<HTML
        <video src="/images/index_video.mp4" id="video-background" muted autoplay loop></video>
        
HTML;

        // 根據當前頁面輸出對應的 Header
        if ($current_page === "index.php") {
            echo $header_for_index;
        } else {
            echo $header_for_others;
        }
        ?>
        <img src="../images/logo.png" id="video_logo" title="">
        <a href="../product.php" id="video_helmet_link">
            <img src="/images/helmet.png" class="video_helmet">
        </a>
        <a href="../product.php" id="video_suit_link">
            <img src="../images/jacket.png" class="video_suit">
        </a>
        <a href="../product.php" id="video_hand_link">
            <img src="../images/gloves.png" class="video_hand">
        </a>
    </div>
</section>