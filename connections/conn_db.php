<?php
// PDO SQL資料庫連線程式
$dsn="mysql:host=localhost;dbname=expstore;charset=utf8";
$user="sales";
//$user="root";
$password="123456";
$link=new PDO($dsn,$user,$password);
date_default_timezone_set("asia/taipei");
// PHP 5.3.6以前版本須加下面這行
$link->exec("set names utf8");
?>
<?php 
// $dsn: 這是一個字串，包含了資料庫連線的詳細資訊。
//     mysql: 資料庫類型（在這裡是 MySQL）。
//     host=localhost: 指定資料庫伺服器的位置，這裡使用 localhost，代表資料庫伺服器在本地。
//     dbname=expstore: 指定要連線的資料庫名稱，這裡是 expstore。
//     charset=utf8: 設定資料庫的字符編碼為 UTF-8，確保資料的讀寫不會出現編碼問題。

// $user: 設定用來連接資料庫的使用者名稱，這裡是 sales。

// $password: 設定用來連接資料庫的使用者密碼，這裡是 123456。

// $link=new PDO($dsn,$user,$password):

// 使用 PDO 類別來創建一個新的資料庫連線對象 $link。
// PDO 的建構函數接受三個參數：
//     連線字串 $dsn（包含了資料庫類型、位置、資料庫名稱等）。
//     使用者名稱 $user。
//     密碼 $password。

// $link->exec("set names utf8"):
//     這行程式碼是用來執行一條 SQL 查詢，設定資料庫的字符編碼為 UTF-8，以確保資料在處理過程中不會發生編碼錯誤。
// exec() 方法是 PDO 提供的執行 SQL 語句的方法
//     執行的 SQL 語句是 SET NAMES utf8
    
// 注意：這條語句主要在較舊的 PHP 版本（PHP 5.3.6 以下）中使用。從 PHP 5.3.6 以後，PDO 會自動處理字符集設定，因此這行程式碼在新的 PHP 版本中是多餘的。
?>