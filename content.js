// 切換#content在首頁與產品頁的CSS
document.addEventListener('DOMContentLoaded', function() {
    // 確保 DOM 完全加載後執行此函數

    // 獲取當前 URL 或頁面名稱
    const currentPage = window.location.pathname.split('/').pop(); // 透過 pathname 取得路徑，並用 split 提取最後的檔案名稱

    // 獲取 #content 元素
    const contentElement = document.querySelector('#content'); // 使用 querySelector 選擇 #content 元素

    if (contentElement) { // 檢查是否成功獲取到元素
        if (currentPage === 'index_p01.php') { // 如果當前頁面是 index_p01.php 或 index.php
            // 為 index_p01.php 和 index.php 應用特定的 CSS 樣式
            contentElement.style.width = '100%'; // 設定寬度為 100%
            contentElement.style.height = '100vh'; // 設定高度為視窗的 100%
            contentElement.style.overflow = 'hidden'; // 隱藏內容溢出部分
        } else {
            // 為其他頁面應用預設的 CSS 樣式
            contentElement.style.width = '100%'; // 設定寬度為 100%
            contentElement.style.height = ''; // 移除高度設置
            contentElement.style.overflow = ''; // 移除溢出設置
        }
    }
});