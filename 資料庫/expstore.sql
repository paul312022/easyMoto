-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-03-10 07:21:31
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `expstore`
--

-- --------------------------------------------------------

--
-- 資料表結構 `addbook`
--

CREATE TABLE `addbook` (
  `addressid` int(10) NOT NULL COMMENT '地址ID',
  `setdefault` tinyint(1) NOT NULL DEFAULT 0 COMMENT '預設收件人',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `cname` varchar(30) NOT NULL COMMENT '收件者姓名',
  `mobile` varchar(20) NOT NULL COMMENT '收件者電話',
  `myzip` varchar(10) DEFAULT NULL COMMENT '郵遞區號',
  `address` varchar(200) NOT NULL COMMENT '收件地址',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `addbook`
--

INSERT INTO `addbook` (`addressid`, `setdefault`, `emailid`, `cname`, `mobile`, `myzip`, `address`, `create_date`) VALUES
(2, 1, 2, '林小強', '0912345678', '882', '工業區一路100號', '2025-02-24 06:34:08'),
(3, 1, 3, '李小明', '0912345678', '881', '中正路1號', '2025-02-24 06:37:55'),
(4, 0, 4, '陳小信', '0912345678', '823', '中正路14號', '2025-02-24 07:22:49'),
(5, 1, 4, '曹小成', '0912346789', '104', '中山路一段165號', '2025-03-05 00:30:36'),
(6, 0, 4, '老陳', '0912346789', '202', '中華路5號', '2025-03-05 00:32:08'),
(7, 0, 12, '小吳', '0912346789', '200', '凱陽路15號之2', '2025-03-07 03:39:08'),
(8, 1, 12, '小陳', '0912346789', '201', '朝馬路54號', '2025-03-07 03:39:28');

-- --------------------------------------------------------

--
-- 資料表結構 `carousel`
--

CREATE TABLE `carousel` (
  `caro_id` int(3) NOT NULL COMMENT '輪播編號',
  `caro_title` varchar(50) DEFAULT NULL COMMENT '輪播標題',
  `caro_content` varchar(100) DEFAULT NULL COMMENT '輪播內容介紹',
  `caro_online` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上下架',
  `caro_sort` int(3) NOT NULL COMMENT '輪播排序',
  `caro_pic` varchar(50) NOT NULL COMMENT '輪播圖檔名稱',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `carousel`
--

INSERT INTO `carousel` (`caro_id`, `caro_title`, `caro_content`, `caro_online`, `caro_sort`, `caro_pic`, `p_id`, `create_date`) VALUES
(1, '2025新春福袋', NULL, 1, 1, 'show1.webp', 0, '2025-01-24 22:56:04'),
(2, 'ROUGH&ROAD', NULL, 1, 2, 'show2.webp', 0, '2025-01-24 22:56:06'),
(3, 'DEGNER', NULL, 1, 3, 'show3.webp', 0, '2025-01-24 22:56:44'),
(4, 'TAICHI', NULL, 1, 4, 'show4.webp', 0, '2025-01-24 22:56:57');

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cartid` int(10) NOT NULL COMMENT '購物車編號',
  `emailid` int(10) DEFAULT NULL COMMENT '會員編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `p_size` varchar(3) NOT NULL,
  `qty` int(3) NOT NULL COMMENT '產品數量',
  `orderid` varchar(30) DEFAULT NULL COMMENT '訂單編號',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '訂單處理狀態',
  `ip` varchar(200) NOT NULL COMMENT '訂購者的IP',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '加入購物車時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `cart`
--

INSERT INTO `cart` (`cartid`, `emailid`, `p_id`, `p_size`, `qty`, `orderid`, `status`, `ip`, `create_date`) VALUES
(22, 12, 3, 'S', 1, '2025030711393765410', 8, '::1', '2025-02-20 00:56:46'),
(23, 12, 9, 'S', 1, '2025030711393765410', 8, '::1', '2025-02-20 01:17:56'),
(24, 12, 7, 'M', 1, '2025030711393765410', 8, '::1', '2025-03-05 00:50:26'),
(25, 12, 10, 'S', 1, '2025030711435988056', 8, '::1', '2025-03-07 03:41:13'),
(26, 12, 4, 'L', 1, '2025030711490323235', 8, '::1', '2025-03-07 03:48:46'),
(27, 4, 4, 'S', 1, '2025031001432751162', 8, '::1', '2025-03-10 05:43:21'),
(28, 4, 2, '2XL', 1, '2025031001435028286', 8, '::1', '2025-03-10 05:43:38'),
(29, 4, 13, 'S', 1, '2025031002005213954', 8, '::1', '2025-03-10 06:00:46'),
(30, 4, 16, 'S', 1, '2025031002010590001', 8, '::1', '2025-03-10 06:01:00'),
(31, 4, 18, 'S', 1, '2025031002011743440', 8, '::1', '2025-03-10 06:01:11'),
(32, 4, 6, 'S', 1, '2025031002013173739', 8, '::1', '2025-03-10 06:01:26'),
(33, NULL, 11, 'S', 1, NULL, 1, '::1', '2025-03-10 06:01:45');

-- --------------------------------------------------------

--
-- 資料表結構 `city`
--

CREATE TABLE `city` (
  `AutoNo` int(10) NOT NULL COMMENT '城市編號',
  `Name` varchar(150) NOT NULL COMMENT '城市名稱',
  `cityOrder` tinyint(2) NOT NULL COMMENT '標記',
  `State` smallint(6) NOT NULL COMMENT '狀態'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `city`
--

INSERT INTO `city` (`AutoNo`, `Name`, `cityOrder`, `State`) VALUES
(1, '臺北市', 0, 0),
(2, '基隆市', 0, 0),
(3, '新北市', 0, 0),
(4, '宜蘭縣', 0, 0),
(5, '新竹市', 0, 0),
(6, '新竹縣', 0, 0),
(7, '桃園市', 0, 0),
(8, '苗栗縣', 0, 0),
(9, '台中市', 0, 0),
(10, '彰化縣', 0, 0),
(11, '南投縣', 0, 0),
(12, '雲林縣', 0, 0),
(13, '嘉義市', 0, 0),
(14, '嘉義縣', 0, 0),
(15, '台南市', 0, 0),
(16, '高雄市', 0, 0),
(17, '南海諸島', 0, 0),
(18, '澎湖縣', 0, 0),
(19, '屏東縣', 0, 0),
(20, '台東縣', 0, 0),
(21, '花蓮縣', 0, 0),
(22, '金門縣', 0, 0),
(23, '連江縣', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `hot`
--

CREATE TABLE `hot` (
  `h_id` int(3) NOT NULL COMMENT '熱銷商品流水號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `h_sort` int(3) DEFAULT NULL COMMENT '熱銷商品排名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `hot`
--

INSERT INTO `hot` (`h_id`, `p_id`, `h_sort`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `emailid` int(11) NOT NULL COMMENT 'email流水號',
  `email` varchar(100) NOT NULL COMMENT 'email帳號',
  `pw1` varchar(50) NOT NULL COMMENT '密碼',
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否啟動',
  `cname` varchar(30) NOT NULL COMMENT '中文姓名',
  `tssn` varchar(20) NOT NULL COMMENT '身份證字號',
  `birthday` date NOT NULL COMMENT '生日',
  `imgname` varchar(20) DEFAULT NULL COMMENT '相片檔名',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`emailid`, `email`, `pw1`, `active`, `cname`, `tssn`, `birthday`, `imgname`, `create_date`) VALUES
(1, 'test@gmail.com', '000', 1, '小林', 'A123456789', '2025-02-17', NULL, '2025-02-17 05:06:04'),
(2, 'test11@gmail.com', '25f9e794323b453885f5181f1b624d0b', 1, '哈', 'a123456789', '2025-02-11', '站長.jpg', '2025-02-24 06:34:08'),
(3, 'test1@gmail.com', '25f9e794323b453885f5181f1b624d0b', 1, '哈', 'a123456789', '2025-02-07', 'mc.gif', '2025-02-24 06:37:55'),
(4, 'pwis0000@gmail.com', '4a7d1ed414474e4033ac29ccb8653d9b', 1, '小趙', 'a123456789', '2025-02-20', '', '2025-02-24 07:22:49');

-- --------------------------------------------------------

--
-- 資料表結構 `multiselect`
--

CREATE TABLE `multiselect` (
  `msid` int(5) NOT NULL COMMENT '多功能選擇ID',
  `mslevel` int(2) NOT NULL COMMENT '多功能選擇層級',
  `msuplink` int(4) NOT NULL COMMENT '上層連結',
  `opcode` varchar(10) DEFAULT NULL COMMENT '外掛參數',
  `msname` varchar(50) NOT NULL COMMENT '多功能選擇名稱',
  `msort` int(11) DEFAULT NULL COMMENT '各功能列表排序',
  `url1` varchar(200) DEFAULT NULL COMMENT '外掛網址1',
  `url2` varchar(200) DEFAULT NULL COMMENT '外掛網址2',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期',
  `update_date` varchar(50) DEFAULT NULL COMMENT '修改日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `multiselect`
--

INSERT INTO `multiselect` (`msid`, `mslevel`, `msuplink`, `opcode`, `msname`, `msort`, `url1`, `url2`, `create_date`, `update_date`) VALUES
(1, 1, 0, NULL, '付款方式', 0, NULL, NULL, '2023-08-11 09:46:53', '2023-08-17 03:42:28'),
(2, 1, 0, NULL, '訂單處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(3, 2, 1, NULL, '貨到付款', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:37'),
(4, 2, 1, NULL, '信用卡付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:54'),
(5, 2, 1, NULL, '銀行轉帳', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:37'),
(6, 2, 1, NULL, '電子支付', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:51'),
(7, 2, 2, NULL, '處理中', 1, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:03'),
(8, 2, 2, NULL, '待出貨', 2, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:32'),
(9, 2, 2, NULL, '運送中', 3, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:45'),
(10, 2, 2, NULL, '收貨完成', 4, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:10'),
(11, 2, 2, NULL, '退貨中', 5, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:24'),
(12, 2, 2, NULL, '已關閉訂單', 6, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:35'),
(13, 2, 2, NULL, '無效訂單', 7, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 05:39:26'),
(14, 2, 2, NULL, '訂單確認', 8, NULL, NULL, '2023-08-18 06:13:47', '2023-10-23 12:37:36'),
(15, 2, 2, NULL, '平台出貨', 9, NULL, NULL, '2023-08-18 06:13:47', '2023-10-25 08:29:31'),
(34, 1, 0, NULL, '付款處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(35, 2, 34, NULL, '侍貨到付款', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(36, 2, 34, NULL, '完成付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(37, 2, 34, NULL, '未完成付款', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(38, 2, 34, NULL, '貨到付款已完成', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `p_name` varchar(200) NOT NULL COMMENT '產品名稱',
  `p_intro` varchar(200) DEFAULT NULL COMMENT '產品簡介',
  `p_price` int(11) DEFAULT NULL COMMENT '產品單價',
  `p_open` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上架',
  `p_content` text DEFAULT NULL COMMENT '產品詳細規格',
  `p_date` timestamp NULL DEFAULT current_timestamp() COMMENT '產品輸入日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(1, 11, 'Arai Astro-GX 素色 全罩式安全帽', NULL, 18000, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-HUOAOTPJ-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div style=\"text-align: center;\"><iframe allowfullscreen=\"\" class=\"sl-lazy\" frameborder=\"0\" height=\"515\" src=\"https://www.youtube.com/embed/1KO2EXV6kWI\" title=\"YouTube video player\" width=\"916\"></iframe></div>\n<div><span style=\"font-size: large;\"><br/></span></div>\n<div style=\"text-align: center;\">\n<span style=\"font-size: x-large; font-weight: bold;\">讓旅行與眾不同</span><br/>\n</div>\n<div><span style=\"font-size: large;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．由Arai獨創的最新超級纖維:PB-cLc2製成，強度比玻璃纖維更高出40%。</span></div>\n<div><span style=\"font-size: medium;\">．擴大了帽體入口，相比以前的型號全側加寬了5mm，使穿脫更為方便舒適。</span></div>\n<div><span style=\"font-size: medium;\">．基於RX7X開發的GT大型尾翼，改良為長途的休旅巡航使用，且具備負壓排氣的作用，長時間佩戴也不會感到疲倦。</span></div>\n<div><span style=\"font-size: medium;\">．前額首次出現的隱藏式商標通風系統，ARAI堅持在不破壞安全性能的情況下進一步提高透氣舒適性。</span></div>\n<div><span style=\"font-size: medium;\">．新開發的頂通風體積更小，但進氣量與傳統的IC Duct 3和TDF Duct 風道相當，且容易操作。</span></div>\n<div><span style=\"font-size: medium;\">．堅持了R75 SHAPE的設計理念，圓潤且光滑的外殼能最大限度分散撞擊力與降低摩擦阻力。</span></div>\n<div><span style=\"font-size: medium;\">．外側的通風件與尾翼，皆設計為受到衝擊時容易脫離與破碎，以維持帽體安全。</span></div>\n<div><span style=\"font-size: medium;\">．全新設計的GX EP系統內襯，允許小幅調整，並且具有可調節側部厚度的功能。</span></div>\n<div><span style=\"font-size: medium;\">．搭載VAS鏡座系統，除了掀動鏡片更加流暢以外，可安裝除霧片與ProShad外掛式墨片。</span></div>\n<div><span style=\"font-size: medium;\">．內襯緊急釋放系統 (ERS)，在危急時 EMT人員更能安全快速的將安全帽脫下避免對頸椎造成二次傷害。</span></div>\n<div><span style=\"font-size: medium;\">．配有藍芽喇叭預留空間，耳機設計在一個貼合且易於接線的位置，可輕鬆安裝。</span></div>\n<div><span style=\"font-size: medium;\">  </span></div>\n<div><span style=\"font-size: medium;\">  </span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">XS / S / M / L / XL</span></div>\n<div><span style=\"font-size: medium;\">SNELL、JIS、ECE22.06認證</span></div>\n<div><span style=\"font-size: medium;\">重量:1550g左右</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">XS：53~54cm</span></div>\n<div><span style=\"font-size: medium;\">S：55~56cm</span></div>\n<div><span style=\"font-size: medium;\">M：57~58cm </span></div>\n<div><span style=\"font-size: medium;\">L：59~60cm</span></div>\n<div><span style=\"font-size: medium;\">XL：61~62cm</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div><span style=\"font-size: medium;\">  </span></div>\n<div><span style=\"font-size: medium;\">   </span></div>\n<div><span style=\"font-size: large;\">注意事項：</span></div>\n<div><span style=\"font-size: medium;\">．商標頂部的開關向下時打開通風，向上時關閉。</span></div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div><span style=\"font-size: medium;\">．進口商品於其他平台和實體門市同步販售，庫存無法即時更新，如需要可先詢問。</span></div>\n<div><span style=\"font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。<br/></span></div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1668.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadc6e72c3001b1b042f/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadc6e72c3001b1b042f/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadc6e72c3001b1b042f/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadc6e72c3001b1b042f/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadc6e72c3001b1b042f/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadc6e72c3001b1b042f/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadc6e72c3001b1b042f/1512x.jpg? 1512w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadc6e72c3001b1b042f/2160x.jpg? 2160w\" width=\"1667.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1668.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadda6616d002d902fc7/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadda6616d002d902fc7/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadda6616d002d902fc7/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadda6616d002d902fc7/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadda6616d002d902fc7/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadda6616d002d902fc7/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadda6616d002d902fc7/1512x.jpg? 1512w, https://shoplineimg.com/5be4227a02dd95000178fa71/62a2dadda6616d002d902fc7/2160x.jpg? 2160w\" width=\"1668.0\"/> </li> </ul> </div> </div>', '2025-01-23 05:15:07'),
(2, 11, 'SHOEI GT-Air 3 素色 全罩安全帽', NULL, 20000, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-YTBXMHCY-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<iframe allowfullscreen=\"\" class=\"sl-lazy\" frameborder=\"0\" height=\"600\" src=\"https://www.youtube.com/embed/-IKTNJXfjo8\" title=\"GT-Air 3プロモーション映像【SHOEI公式】\" width=\"1100\"></iframe><div><br/></div>\n<div>\n<span style=\"font-size: large;\">商品說明：</span><div><span style=\"font-size: medium;\">．集結實測以及風洞測試所建構的空氣動力學帽體。</span></div>\n<div><span style=\"font-size: medium;\">．進化出非常方便的微型棘輪式下巴帶，即使戴著厚手套也可以收緊和釋放，使用上更為方便容易。</span></div>\n<div><span style=\"font-size: medium;\">．新設計繼承了GT-Air系列的特色頭頂設計，有助於駕駛時的穩定性，並增強了外殼與部件的統一感。</span></div>\n<div><span style=\"font-size: medium;\">．將出風口設置得比以前的型號更靠前，提高了排氣量。</span></div>\n<div><span style=\"font-size: medium;\">．下部進氣口配有可拆卸的除霜過濾器，可防止昆蟲進入。<br/></span></div>\n<div><span style=\"font-size: medium;\">．帽體各處針對空氣流過時的擾流功能。</span></div>\n<div><span style=\"font-size: medium;\">．多處的擾流設計和進排氣讓帽體抬升以及風阻在高速下縮減到最小。</span></div>\n<div><span style=\"font-size: medium;\">．內建的<span style=\"text-align: center;\">QSV-2遮陽板，</span>具有堪比歐洲太陽眼鏡標準的高光學性能。</span></div>\n<div><span style=\"font-size: medium;\">．採用乾爽舒適的 HYGRA®的混合布料。</span></div>\n<div><span style=\"font-size: medium;\">．GT-Air3 附帶的下巴簾面積比之前的型號更大，可以更好地防止風從下巴下方進入。</span></div>\n<div><span style=\"font-size: medium;\">．預留SENA SRL3藍芽耳機配置可實現最佳的外觀。</span></div>\n<div><span style=\"font-size: medium;\">．頂級款才有的 E.Q.R.S也應用在GT-Air，可以迅速脫離，確保頸椎不受二次傷害。</span></div>\n<div><span style=\"font-size: medium;\">．帽體通過 DOT-218 的安全規格標準。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">M / L / XL / 2XL</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">M：57-58cm</span></div>\n<div><span style=\"font-size: medium;\">L：59-60cm</span></div>\n<div><span style=\"font-size: medium;\">XL：61-62cm</span></div>\n<div>\n<span style=\"font-size: medium;\">2XL：63-64cm<br/><br/></span><div class=\"tidied-202108062308-2\"><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div class=\"tidied-202108062308-2\"><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div class=\"tidied-202108062308-2\"><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div class=\"tidied-202108062308-2\"><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div class=\"tidied-202108062308-2\"><span style=\"font-size: medium;\"> </span></div>\n<div class=\"tidied-202108062308-2\"><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n</div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div>\n<div>\n<div><span style=\"font-size: large;\">注意事項：</span></div>\n<div><span style=\"font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div><span style=\"font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</div>\n<div><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\"><br/></span></div>\n</div>\n</div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"11235.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/667512025600830013805d94/375x.png? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/667512025600830013805d94/540x.png? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/667512025600830013805d94/720x.png? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/667512025600830013805d94/900x.png? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/667512025600830013805d94/1080x.png? 1080w\" width=\"1000.0\"/> </li> </ul> </div> </div>', '2025-01-23 05:15:59'),
(3, 11, 'SHOEI X-Fifteen X-15 素色 全罩式安全帽 頂級款 X15', NULL, 21000, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-VOSVSWRR-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div style=\"text-align: center;\"><img class=\"sl-lazy\" src=\"https://img.shoplineapp.com/media/image_clips/645dee8bd3d23a001d452730/original.jpg?1683877515\"/></div>\n<br/><iframe allowfullscreen=\"\" class=\"sl-lazy\" frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/1MMvj84W5Vw\" title=\"X-Fifteen プロモーション映像【SHOEI公式】\" width=\"560\"></iframe><div><br/></div>\n<div>\n<div><span style=\"font-size: xx-large; font-weight: bold; color: rgb(156, 39, 39);\">體驗源自MotoGP賽事的先進空氣動力性能</span></div>\n<div><span style=\"font-size: xx-large; font-weight: bold; color: rgb(156, 39, 39);\"><br/></span></div>\n<div>\n<div><span style=\"font-size: large; color: rgb(64, 59, 59);\">X-Fourteen 以其出色的空氣動力學性能席捲了全球賽車界。</span></div>\n<div><span style=\"font-size: large; color: rgb(64, 59, 59);\">為求更好的空氣力學，經過長期研究和風洞實驗，全新設計的X-Fifteen誕生了。</span></div>\n<div><span style=\"font-size: large; color: rgb(64, 59, 59);\">全力致力於為騎士的勝利做出貢獻的X-Fifteen，將在賽車界掀起一股新旋風。</span></div>\n</div>\n<div><br/></div>\n<br/><div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: large;\">商品說明：</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．全新設計的氣動造型，在超過350km/h的超高速下也能展現出穩定的氣動性能。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．與X-14相比，X-15 的升力降低了 1.6%，而阻力降低了 6.1%。 </span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．安全帽內部的EPS風道比前代深1.5倍以上，後鴨尾的孔洞設計部分配備了出風孔，以實現更高的通風性能。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．配備與Z-8相同的中置鎖定型 CWR-F2R 鏡片，可增強防護與膠條之間的附著力，防止風雨進入。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．除了中置式鏡片扣同時也有鏡片鎖兩種來固定鏡片，以防止在墜落時意外彈開鏡片。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．鏡片底座配備了新的扳機鎖定機構，可以防止鏡片因衝擊而脫落。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．上視野的位置比之前的型號增加了 5mm，確保了更寬的上部視野。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．分體式內襯進一步進化，每個襯墊都是口袋型，可根據頭形部分關閉，或者更換不同厚度。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．表層面料使用吸水速乾性優異的HYGRA，穿脫時與皮膚摩擦的部位使用柔軟的拉絨面料。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．全新的中置型鎖式 CWR-F2R鏡片，左右兩端同 CWR-F 系列有導流鰭，能更有效的抑制行駛中的風切聲</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．E.Q.R.S（緊急快速釋放系統），意外發生能讓頸部負擔最小化。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\"> </span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\"> </span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: large;\">商品規格：</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">M / L / XL </span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'>\n<div style=\"font-family: var(--font-family-paragraph);\"><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">材質：AIM+複合纖維外殼</span></div>\n<div style=\"font-family: var(--font-family-paragraph);\"><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">附屬物品：專用布袋/ Pinlock除霧片 / 鼻罩 / 下巴網 / 下巴導流板 / 矽油 </span></div>\n</div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\"><br style=\"font-family: var(--font-family-paragraph);\"/></span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: large;\">尺寸：</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">XS：53～54 cm</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">S：55～56 cm</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">M：57～58 cm</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">L：59～60 cm</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">XL：61～62 cm</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">2XL：63～64 cm</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\"><br style=\"font-family: var(--font-family-paragraph);\"/></span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">  </span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">※頭圍測量方法：</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\"><br style=\"font-family: var(--font-family-paragraph);\"/></span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\"> </span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\"> </span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><div class=\"ProductDetail-description\" style=\"font-family: var(--font-family-paragraph); margin-bottom: 15px;\"><div style=\"font-family: var(--font-family-paragraph);\">\n<div style=\"font-family: var(--font-family-paragraph);\"><span style=\"font-family: var(--font-family-paragraph); font-size: large;\">注意事項：</span></div>\n<div style=\"font-family: var(--font-family-paragraph);\"><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div style=\"font-family: var(--font-family-paragraph);\"><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div style=\"font-family: var(--font-family-paragraph);\"><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div style=\"font-family: var(--font-family-paragraph);\"><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div style=\"font-family: var(--font-family-paragraph);\"><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</div></div></div>\n</div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26f0dbd00147dd2e6/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26f0dbd00147dd2e6/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26f0dbd00147dd2e6/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26f0dbd00147dd2e6/900x.jpg? 900w\" width=\"835.0\"> </img></li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26141dd0011ffadad/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26141dd0011ffadad/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26141dd0011ffadad/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26141dd0011ffadad/900x.jpg? 900w\" width=\"834.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645decc2dbcc9b000e02a2b2/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc2dbcc9b000e02a2b2/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc2dbcc9b000e02a2b2/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc2dbcc9b000e02a2b2/900x.jpg? 900w\" width=\"834.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645decc107181d001d3e1948/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc107181d001d3e1948/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc107181d001d3e1948/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc107181d001d3e1948/900x.jpg? 900w\" width=\"835.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645decc2243ed000143f5ffb/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc2243ed000143f5ffb/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc2243ed000143f5ffb/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc2243ed000143f5ffb/900x.jpg? 900w\" width=\"835.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26b1d26002198fa32/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26b1d26002198fa32/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26b1d26002198fa32/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc26b1d26002198fa32/900x.jpg? 900w\" width=\"835.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645decc307181d2e973e0ea8/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc307181d2e973e0ea8/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc307181d2e973e0ea8/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc307181d2e973e0ea8/900x.jpg? 900w\" width=\"834.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645decc3fa7716000e01cec6/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc3fa7716000e01cec6/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc3fa7716000e01cec6/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645decc3fa7716000e01cec6/900x.jpg? 900w\" width=\"835.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645de26f52341d000dfa3b6c/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645de26f52341d000dfa3b6c/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645de26f52341d000dfa3b6c/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645de26f52341d000dfa3b6c/900x.jpg? 900w\" width=\"835.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645de26f9e1513001401a4fc/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645de26f9e1513001401a4fc/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645de26f9e1513001401a4fc/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645de26f9e1513001401a4fc/900x.jpg? 900w\" width=\"834.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"834.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/645de26fb51e04001704a605/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/645de26fb51e04001704a605/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/645de26fb51e04001704a605/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/645de26fb51e04001704a605/900x.jpg? 900w\" width=\"835.0\"/> </li> </ul> </div> </div>', '2025-01-23 05:19:14'),
(4, 11, 'SHOEI Z-8 素色 SOLID 全罩式安全帽 輕量 Z8', NULL, 17000, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-OCXBMBBX-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html>\n<head>\n<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\n<style>        .custom-image-container {            display: flex;            justify-content: center;            align-items: center;            margin: 0 auto;            max-width: 100%;            box-sizing: border-box;            padding: 10px; /* 這裡可以調整內邊距 */        }        .custom-image {            max-width: 100%;            height: auto;        }        @media (min-width: 768px) {            /* 桌面模式 */            .custom-image {                content: url(\'https://img.shoplineapp.com/media/image_clips/66b1db0aebc28c001cb42b37/original.jpg?1722931978\');            }        }        @media (max-width: 767px) {            /* 手機模式 */            .custom-image {                content: url(\'https://img.shoplineapp.com/media/image_clips/66b1db0d2bb5b5000d278fc1/original.jpg?1722931980\');            }        }    </style> <title>不同裝置展示圖片</title> </head>\n<body>\n<div class=\"custom-image-container\"> <img alt=\"展示圖片\" class=\"custom-image sl-lazy\" src=\"https://img.shoplineapp.com/media/image_clips/66b1db0aebc28c001cb42b37/original.jpg?1722931978\"/> </div>\n<div class=\"custom-image-container\"><iframe allowfullscreen=\"\" class=\"sl-lazy\" frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/M4Y70oWT55E\" style=\"text-align: center; width: 1340.91px;\" title=\"Z-8プロモーション映像【SHOEI公式】\" width=\"400\"></iframe></div>\n<div style=\"text-align: center;\"><span style=\"font-size: large; font-weight: bold; color: rgb(17, 77, 151);\"><br/></span></div>\n<div><span style=\"font-size: large; font-weight: bold; color: rgb(17, 77, 151);\">以輕盈的形式創造舒適的騎乘</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">Z系列具有緊湊和輕便的概念</span></div>\n<div><span style=\"font-size: medium;\">“ Z-8”是新一代產品，具有運動型設計以及改善Z-7的缺陷，可提供舒適的騎行體驗。</span></div>\n<div><span style=\"font-size: medium;\">我們追求更高的“舒適性能”，例如具有改善的視野和可操作性的新型鏡片系統。</span></div>\n<div><span style=\"font-size: medium;\">以及通過引入和排出有效的運行風而建立的高效通風系統。</span></div>\n<div><span style=\"font-size: medium;\">Z系列的緊湊，輕巧和舒適性能創造了舒適的運動騎行體驗。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．全罩陣容中最輕的 Shoei (1390g)。</span></div>\n<div><span style=\"font-size: medium;\">．4種外殼尺寸。</span></div>\n<div><span style=\"font-size: medium;\">．高級的降噪效果，全新設計減少風切聲。</span></div>\n<div><span style=\"font-size: medium;\">．高速騎乘時的上掀風力比Z7減輕6%、正面風阻減輕4%。</span></div>\n<div><span style=\"font-size: medium;\">．雙密度EPS襯墊。</span></div>\n<div><span style=\"font-size: medium;\">．出眾的通風。</span></div>\n<div><span style=\"font-size: medium;\">．3D Max-Dry System II 襯墊。</span></div>\n<div><span style=\"font-size: medium;\">．E.Q.R.S. （內襯緊急快拆系統）。</span></div>\n<div><span style=\"font-size: medium;\">．新的 CWR-F2 鏡片改為中置式開啟，有鏡片鎖，同時有降低風切的導流鰭。</span></div>\n<div><span style=\"font-size: medium;\">．Z-8同樣延續 Z-7的輕量化設計，整體緊湊流線。</span></div>\n<div><span style=\"font-size: medium;\">．全新的膠圈設計,改善膠圈常因開合斷裂的狀況發生。</span></div>\n<div><span style=\"font-size: medium;\">．Snell M2020 和 DOT 認證。  </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">M / L / XL / 2XL</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">  </span></div>\n<div><span style=\"font-size: large;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">XS：53～54 cm</span></div>\n<div><span style=\"font-size: medium;\">S：55～56 cm</span></div>\n<div><span style=\"font-size: medium;\">M：57～58 cm</span></div>\n<div><span style=\"font-size: medium;\">L：59～60 cm</span></div>\n<div><span style=\"font-size: medium;\">XL：61～62 cm</span></div>\n<div><span style=\"font-size: medium;\">2XL：63～64 cm</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">  </span></div>\n<div><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div>\n<span style=\"font-size: large;\">注意事項：</span><br/><div><span style=\"font-size: medium;\">．進口商品於其他平台同步販售，請先詢問庫存。</span></div>\n</div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經封使用無法退換貨，還請見諒。</span></div>\n<style>    .custom-image-container {        display: flex;        justify-content: center;        align-items: center;        margin: 0 auto;        max-width: 100%;        box-sizing: border-box;        padding: 10px; /* 這裡可以調整內邊距 */    }    .custom-image {        max-width: 100%;        height: auto;    }    @media (min-width: 768px) {        /* 桌面模式 */        .custom-image {            content: url(\'https://img.shoplineapp.com/media/image_clips/6694d7277a4ba30016e03b51/original.jpg?1721030439\');        }    }    @media (max-width: 767px) {        /* 手機模式 */        .custom-image {            content: url(\'https://img.shoplineapp.com/media/image_clips/6694d7290f852000194ec608/original.jpg?1721030441\');        }    }</style>\n</body>\n</html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> </div>', '2025-01-23 05:20:42'),
(5, 12, 'Arai VZ-RAM 素色 半罩式安全帽', NULL, 16100, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-HOYDJONZ-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body><div class=\"tidied-201710264360-2 tidied-201711136825-2 tidied-201712197313-1 tidied-201712265943-1\" style=\'font-size: medium; font-family: \"Times New Roman\"; text-align: center; color: rgb(0, 0, 0);\'><div class=\"tidied-201710264360-2 tidied-201711136825-2 tidied-201712197313-1 tidied-201712265943-1 tidied-201907175569-1\"><div class=\"tidied-201710264360-2 tidied-201711136825-2 tidied-201712197313-1 tidied-201712265943-1 tidied-201907175569-1\"><div class=\"tidied-201710264360-2 tidied-201711136825-2 tidied-201712197313-1 tidied-201712265943-1 tidied-201907175569-1\" style=\"text-align: center;\">\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: large;\">商品說明：</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．相較SZ-RAM4耳蓋縮小了14MM將外型更加的圓滑增加安全減少衝擊力。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．新款VAS-Z變軸鏡座系統縮小，鏡框開口耳蓋拆裝上更加方便不怕拆壞。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．可拆裝的PRO SHADE遮陽外鏡片系統(依需求可另購)</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．新一代F1頭盔技術帽殼材質PB-cLc2高強度，更輕量。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．MDL不同密度襯墊區塊配置 發揮理想的緩衝效果。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．使用多個安全帽進行跌落測試的數據精確調整重新配置的帽體重心，更佳輕盈舒適。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．與RX-7X相同的高規格進排氣口。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．前額涼爽強力降溫/帽體穩定減少晃動並保持內部的乾爽。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．可扣 PINLOCK 防霧片(依需求可另購)</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．Ecopure 抗菌、防臭、防汙全可拆內襯，頭頂襯、兩頰、頤帶。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．符合SNELL 及日本 JIS 規格認證。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">    </span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\"> </span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: large;\">商品規格：</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">帽體 Shell: PB-cLc2</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">規格 Standard: Snell, JIS</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">尺碼 Size: XS - XL</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">日本製造. Made in Japan</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">重量：約1400g ±50g。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\"><br/></span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">尺寸：</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">M：57-58cm</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">L：59-60cm</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">XL：61-62cm</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\"><br/></span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\"><br/></span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\"> </span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\"> </span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: large;\">注意事項：</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．進口商品於其他平台和實體門市同步販售，庫存無法即時更新，如需要可先詢問。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div style=\'color: rgb(85, 85, 85); font-family: \"Open Sans\", Arial; font-size: 14px; text-align: start;\'><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n</div></div></div></div></body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> </div>', '2025-01-23 06:16:41');
INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(6, 12, 'ASTONE DJ15 素色 半罩安全帽', NULL, 2200, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-OWIWWWPW-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．加長型風鏡增加擋風性。</span></div>\n<div><span style=\"font-size: medium;\">．內藏式太陽眼鏡。</span></div>\n<div><span style=\"font-size: medium;\">．內襯三件全可拆洗。</span></div>\n<div><span style=\"font-size: medium;\">．三角耳襯採用一體式設計。</span></div>\n<div><span style=\"font-size: medium;\">．對應保麗龍4個通風口，涼爽舒適不悶熱。</span></div>\n<div><span style=\"font-size: medium;\">．眼鏡溝貼心設計，穿脫更迅速。 </span></div>\n<div><span style=\"font-size: medium;\">．歐洲流行專利排扣，安全兼具便利。</span></div>\n<div><span style=\"font-size: medium;\">．藍芽耳機袋設計。</span></div>\n<div><span style=\"font-size: medium;\">．超快速吸濕排汗內襯。</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">材質：ABS</span></div>\n<div><span style=\"font-size: medium;\">重量：  1590g±50g(含鏡片)</span></div>\n<div><span style=\"font-size: medium;\">通過認證：CNS、DOT</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">XS：51-52cm</span></div>\n<div><span style=\"font-size: medium;\">S：53-54cm</span></div>\n<div><span style=\"font-size: medium;\">M：55-56cm</span></div>\n<div><span style=\"font-size: medium;\">L：57-58cm</span></div>\n<div><span style=\"font-size: medium;\">XL：59-60cm</span></div>\n<div><span style=\"font-size: medium;\">2XL：61-62cm</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">注意事項：</span></div>\n<div><span style=\"font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div><span style=\"font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"667.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301a609ae0011c2e220/375x.png? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301a609ae0011c2e220/540x.png? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301a609ae0011c2e220/720x.png? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301a609ae0011c2e220/900x.png? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301a609ae0011c2e220/1080x.png? 1080w\" width=\"1000.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1000.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301eff105000d29e40d/375x.png? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301eff105000d29e40d/540x.png? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301eff105000d29e40d/720x.png? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301eff105000d29e40d/900x.png? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d301eff105000d29e40d/1080x.png? 1080w\" width=\"1000.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1000.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/6763d3014060fb000e30e74b/375x.png? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d3014060fb000e30e74b/540x.png? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d3014060fb000e30e74b/720x.png? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d3014060fb000e30e74b/900x.png? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/6763d3014060fb000e30e74b/1080x.png? 1080w\" width=\"1000.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:16:43'),
(7, 12, 'OGK EXCEED 素色 半罩安全帽 KABUTO', NULL, 7500, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-YVHFNVCT-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．應用OGK 專利技術Wake Stabilizer穩定氣流，同時將帽型的空力內化與鴉尾套件極限緊湊化。</span></div>\n<div><span style=\"font-size: medium;\">．兼具安全性及輕量化的最適帽。</span></div>\n<div><span style=\"font-size: medium;\">．T.P.S高性能熱塑帽體,具有優異的抗衝擊性。</span></div>\n<div><span style=\"font-size: medium;\">．氣流帽體穩定系統(專利設計),減輕頸部負擔。</span></div>\n<div><span style=\"font-size: medium;\">．內墨鏡片設計,鏡片下緣不漏光。</span></div>\n<div><span style=\"font-size: medium;\">．快拆鏡片設計,按下按鈕並將其推到前面即可釋放。</span></div>\n<div><span style=\"font-size: medium;\">．抗刮抗UV鏡片,可安裝防霧鏡片(另購)。</span></div>\n<div><span style=\"font-size: medium;\">．鏡片下緣強化導風肋條,減輕下巴竄風。</span></div>\n<div><span style=\"font-size: medium;\">．夾層眼鏡溝,便於眼鏡族使用。</span></div>\n<div><span style=\"font-size: medium;\">．全可拆洗COOLMAX內襯吸濕汗冷乾,透氣性極佳。</span></div>\n<div><span style=\"font-size: medium;\">．疊層3D立體耳罩,軟化接觸頤帶部分、更易於著脫。</span></div>\n<div><span style=\"font-size: medium;\">．左右仍預留藍芽、行車記錄器擴充空間。</span></div>\n<div><span style=\"font-size: medium;\">．帽簷止水條也採用上下兩簷、不同段差服貼鏡面的新設計,減輕風雨侵入。</span></div>\n<div><span style=\"font-size: medium;\">．鏡片座同樣引進了全新設計，掀動及蓋闔時的段落感更加明確Ｑ彈未附贈</span></div>\n<div><span style=\"font-size: medium;\">．通過台灣CNS、日本JIS安規認證。 </span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">帽體：ABS (T.P.S.高性能サーモプラスチック帽体)</span></div>\n<div><span style=\"font-size: medium;\">鏡片：PC耐磨抗UV</span></div>\n<div><span style=\"font-size: medium;\">內襯：透氣網布、COOLMAX_3D吸排內襯</span></div>\n<div><span style=\"font-size: medium;\">T.P.S.（高性能サーモプラスチック帽体）</span></div>\n<div><span style=\"font-size: medium;\">S ~ M : 1450 ± 50g (未含內墨片)</span></div>\n<div><span style=\"font-size: medium;\">L ~ XL : 1540 ± 50g (未含內墨片)   </span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">S：55~56cm</span></div>\n<div><span style=\"font-size: medium;\">M：57~58cm</span></div>\n<div><span style=\"font-size: medium;\">L：59~60cm</span></div>\n<div><span style=\"font-size: medium;\">XL：61~62cm</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div><span style=\"font-size: medium;\">  </span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">注意事項：</span></div>\n<div><span style=\"font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div><span style=\"font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> </div>', '2025-01-23 06:18:45'),
(8, 12, 'Arai VZ-RAM NAKAGAMI GP2 中上貴晶 選手彩繪 半罩式安全帽', NULL, 18550, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-SRQTZARD-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．相較SZ-RAM4耳蓋縮小了14MM將外型更加的圓滑增加安全減少衝擊力。</span></div>\n<div><span style=\"font-size: medium;\">．新款VAS-Z變軸鏡座系統縮小，鏡框開口耳蓋拆裝上更加方便不怕拆壞。</span></div>\n<div><span style=\"font-size: medium;\">．可拆裝的PRO SHADE遮陽外鏡片系統(依需求可另購)</span></div>\n<div><span style=\"font-size: medium;\">．新一代F1頭盔技術帽殼材質PB-cLc2高強度，更輕量。</span></div>\n<div><span style=\"font-size: medium;\">．MDL不同密度襯墊區塊配置 發揮理想的緩衝效果。</span></div>\n<div><span style=\"font-size: medium;\">．使用多個安全帽進行跌落測試的數據精確調整重新配置的帽體重心，更佳輕盈舒適。</span></div>\n<div><span style=\"font-size: medium;\">．與RX-7X相同的高規格進排氣口。</span></div>\n<div><span style=\"font-size: medium;\">．前額涼爽強力降溫/帽體穩定減少晃動並保持內部的乾爽。</span></div>\n<div><span style=\"font-size: medium;\">．可扣 PINLOCK 防霧片(依需求可另購)</span></div>\n<div><span style=\"font-size: medium;\">．Ecopure 抗菌、防臭、防汙全可拆內襯，頭頂襯、兩頰、頤帶。</span></div>\n<div><span style=\"font-size: medium;\">．符合SNELL 及日本 JIS 規格認證。</span></div>\n<div><span style=\"font-size: medium;\">    </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">帽體 Shell: PB-cLc2</span></div>\n<div><span style=\"font-size: medium;\">規格 Standard: Snell, JIS</span></div>\n<div><span style=\"font-size: medium;\">尺碼 Size: XS - XL</span></div>\n<div><span style=\"font-size: medium;\">日本製造. Made in Japan</span></div>\n<div><span style=\"font-size: medium;\">重量：約1400g ±50g。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">M：57-58cm</span></div>\n<div><span style=\"font-size: medium;\">L：59-60cm</span></div>\n<div><span style=\"font-size: medium;\">XL：61-62cm</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: large;\">注意事項：</span></div>\n<div><span style=\"font-size: medium;\">．進口商品於其他平台和實體門市同步販售，庫存無法即時更新，如需要可先詢問。</span></div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> </div>', '2025-01-23 06:19:46'),
(9, 13, 'Scorpion VX-16 Air 彩繪 FUSION 越野帽 安全帽', NULL, 6800, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-NWYQETPK-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<iframe allowfullscreen=\"\" class=\"sl-lazy\" frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/66euCm1XlmQ\" title=\"YouTube video player\" width=\"560\"></iframe><div><br/></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div>\n<span style=\"font-size: large;\">商品說明：<br/></span><div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">聚碳酸酯外殼及雙密度EPS，輕量堅固，能承受最大衝擊。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">大面積開口適用大部分護目鏡，橡膠壓邊柔軟防刮。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">大型進風口和出風口，下巴永久通風。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">KwikWick II抗微生物內襯材質，保持乾燥及抑制異味產生，且有設計眼鏡溝。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．Airfit™ 充氣式頰墊系統，提供卓越的貼合強化效果。</span><br/>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">使用鈦合金雙D扣。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">標配緊急內襯釋放系統，發生意外時能夠快速卸下安全帽。</span>\n</div>\n</div>\n<div><span style=\"font-size: medium;\">  </span></div>\n<div><span style=\"font-size: medium;\">   </span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">XS / S / M / L / XL / 2XL</span></div>\n<div><span style=\"font-size: medium;\">認證：ECE22.06 / DOT / CNS</span></div>\n<div><div>\n<div><span style=\"font-size: medium;\">重量：約1250克</span></div>\n<div>\n<span style=\"font-size: medium;\">尺寸：2種帽殼大小（XS-M、L-XXL）<br/>材質</span><span style=\"font-size: medium;\">：TCT 聚碳酸酯</span>\n</div>\n</div></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: large;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">XS：53-54 cm</span></div>\n<div><span style=\"font-size: medium;\">S：55-56 cm</span></div>\n<div><span style=\"font-size: medium;\">M：57-58 cm</span></div>\n<div><span style=\"font-size: medium;\">L：59-60 cm</span></div>\n<div><span style=\"font-size: medium;\">XL：61-62 cm</span></div>\n<div><span style=\"font-size: medium;\">2XL：63-64 cm</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: large;\">注意事項：</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"608.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64c75c93aa79b2001c988e61/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64c75c93aa79b2001c988e61/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64c75c93aa79b2001c988e61/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64c75c93aa79b2001c988e61/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/64c75c93aa79b2001c988e61/1080x.jpg? 1080w\" width=\"1080.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:21:42'),
(10, 13, 'SHOEI VFX-WR 素色 越野式安全帽', '', 16000, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-EAUQQHFH-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body><div><div>\n<iframe allowfullscreen=\"\" class=\"sl-lazy\" frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/GZ0PyIRlodI\" style=\"width: 1512px;\" title=\"YouTube video player\" width=\"560\"></iframe><div><span style=\"font-size: medium; font-weight: bold; color: rgb(0, 0, 0);\"><br/><br/>“VFX”的大膽造型，個性與功能性兼具</span></div>\n<div>\n<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-weight: bold; font-size: medium;\">VFX-WR進一步增加了大膽新穎性，具有震懾力的造型實現了帽簷、鼻罩等配件與殼體形狀一體化。<br/></span></span><span style=\"font-size: medium; font-weight: bold; color: rgb(0, 0, 0);\">頭後部的凸緣形狀一直延伸到側面，不僅能在劇烈振動行駛時固定護目鏡，而且佩戴護目鏡時更容易找到最佳安裝位置。</span>\n</div>\n<div><span style=\"color: rgb(0, 0, 0);\"><span style=\"font-weight: bold; font-size: medium;\">立體造型從帽簷至頭頂部描繪流動性連續線條，通過新成型技術實現了進化</span><span style=\"font-weight: bold; font-size: medium;\">。</span></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．獨家帽殼結構實現了輕量設計更提升安全性。</span></div>\n<div><span style=\"font-size: medium;\">．位於鏡口上部的進氣孔設計為鏟勺形狀，可更有效的引進空氣。</span></div>\n<div><span style=\"font-size: medium;\">．新設計的後部排氣孔與增大的頸部排氣孔，更容易排出帽內熱氣。</span></div>\n<div><span style=\"font-size: medium;\">．採用SHOEI的獨家衝擊力吸收結構MEDS(Motion Energy Distribution System)，改良了雙效緩衝層。</span></div>\n<div><span style=\"font-size: medium;\">．內襯使用3D形狀聚氨酯，兼具柔軟與舒適，面頰及額部使用吸水速乾材料，緩解出汗引起的黏膩感。</span></div>\n<div><span style=\"font-size: medium;\">．頤帶套打孔設計以提高透氣性。</span></div>\n<div><span style=\"font-size: medium;\">．V-470帽簷新設計，即使在劇烈的越野騎行中也可防止帽簷意外滑動。</span></div>\n<div><span style=\"font-size: medium;\">．VFX-WR擴大了口部周圍的開口，同時使用了較大型的鼻罩設計。</span></div>\n<div><span style=\"font-size: medium;\">．配備了防止灰塵進入鼻罩內部的過濾網，外側有防止小石塊等異物進入的鋁製金屬網屏。</span></div>\n<div><span style=\"font-size: medium;\">．EQRS緊急快速釋放系統，可以迅速脫離，確保頸椎不受二次傷害。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">S / M / L / XL / 2XL</span></div>\n<div><span style=\"font-size: medium;\">原廠配件：專用布袋、帽簷、鼻罩、帽沿螺絲</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">XS(53-54cm)</span></div>\n<div><span style=\"font-size: medium;\">S(55-56cm)</span></div>\n<div><span style=\"font-size: medium;\">M(57-58cm)</span></div>\n<div><span style=\"font-size: medium;\">L(59-60cm)</span></div>\n<div><span style=\"font-size: medium;\">XL(61-62cm)</span></div>\n<div><span style=\"font-size: medium;\">2XL(63-64cm)</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div>\n<span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span><span style=\"font-size: medium;\"> </span>\n</div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: large;\">注意事項：</span></div>\n<div><span style=\"font-size: medium;\">．進口商品於其他平台同步販售，部分品項須預訂，請先詢問庫存。</span></div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n</div></div></body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1001.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c0cd1754002075eec7/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c0cd1754002075eec7/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c0cd1754002075eec7/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c0cd1754002075eec7/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c0cd1754002075eec7/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c0cd1754002075eec7/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c0cd1754002075eec7/1512x.jpg? 1512w\" width=\"1500.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1600.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3d6c2e80023fc56ff/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3d6c2e80023fc56ff/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3d6c2e80023fc56ff/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3d6c2e80023fc56ff/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3d6c2e80023fc56ff/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3d6c2e80023fc56ff/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3d6c2e80023fc56ff/1512x.jpg? 1512w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3d6c2e80023fc56ff/2160x.jpg? 2160w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3d6c2e80023fc56ff/2960x.jpg? 2960w\" width=\"2400.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1000.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2e04c310023807645/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2e04c310023807645/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2e04c310023807645/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2e04c310023807645/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2e04c310023807645/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2e04c310023807645/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2e04c310023807645/1512x.jpg? 1512w\" width=\"1500.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1039.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2f105240017a2434c/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2f105240017a2434c/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2f105240017a2434c/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2f105240017a2434c/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2f105240017a2434c/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2f105240017a2434c/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c2f105240017a2434c/1512x.jpg? 1512w\" width=\"1500.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1031.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3168cd800203eaedb/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3168cd800203eaedb/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3168cd800203eaedb/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3168cd800203eaedb/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3168cd800203eaedb/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3168cd800203eaedb/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/639fd5c3168cd800203eaedb/1512x.jpg? 1512w\" width=\"1500.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:23:08'),
(11, 13, 'Airoh TWIST 3.0 彩繪 #4 越野帽 安全帽', NULL, 5500, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-WYVKUSOE-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．歐洲ECE22.06檢驗標準合格。</span></div>\n<div><span style=\"font-size: medium;\">．AEFR緊急快拆：急救時可將兩頰內襯快速拆除。</span></div>\n<div><span style=\"font-size: medium;\">．ASN滑網設計：有效減少衝擊力道提升內部通風性。</span></div>\n<div><span style=\"font-size: medium;\">．新型雙H.R.T熱塑型高耐熱材料：防護強度升級。</span></div>\n<div><span style=\"font-size: medium;\">．頭型為台灣專用版，配戴舒適不夾頭。</span></div>\n<div><span style=\"font-size: medium;\">．五件式全可拆洗吸濕排汗內襯、頰襯夜間反光材質。</span></div>\n<div><span style=\"font-size: medium;\">．全新設計鋁合金+不銹鋼金屬排齒扣。</span></div>\n<div><span style=\"font-size: medium;\">．下巴通風使用過濾棉防止灰塵過敏。</span></div>\n<div><span style=\"font-size: medium;\">．擾流尾翼及空力帽體設計，可在高速下保持穩定性。</span></div>\n<div><span style=\"font-size: medium;\">．全新前額與下巴通風設計，耳側通風孔快速排熱氣。</span></div>\n<div><span style=\"font-size: medium;\">．EPS採用多層多密度組合完整包覆安全提升。</span></div>\n<div><span style=\"font-size: medium;\">．大面積高效前額進氣，後雙尾翼與頸部負壓不積熱。</span></div>\n<div><span style=\"font-size: medium;\">．眼鏡溝設計，內襯上有著鏡腳容納空間更加方便。</span></div>\n<div><span style=\"font-size: medium;\">．預留藍牙耳機安裝，線路裝配預留空間。</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">M / L / XL / 2XL</span></div>\n<div>\n<div><span style=\"font-size: medium;\">重量：1470 ± 50g (未含鏡片)</span></div>\n<div><span style=\"font-size: medium;\">認證：CNS加強型、ECE 22.06</span></div>\n</div>\n<div><span style=\"font-size: medium;\">    </span></div>\n<div><span style=\"font-size: medium;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">M：57-58cm</span></div>\n<div><span style=\"font-size: medium;\">L：59-60cm</span></div>\n<div><span style=\"font-size: medium;\">XL：61-62cm</span></div>\n<div><span style=\"font-size: medium;\">2XL：63-64cm</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div><span style=\"font-size: medium;\">  </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div>\n<div><span style=\"font-size: large;\">注意事項：</span></div>\n<div><span style=\"font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div><span style=\"font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> </div>', '2025-01-23 06:24:37'),
(12, 13, 'NIKKO N-851 EVA 新世紀福音戰士 限量聯名款 13號機 多功能 越野安全帽', NULL, 5990, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-PXSYJRGV-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body><div style=\"text-align: center;\"><div style=\"text-align: start;\">\n<div>\n<span style=\"font-size: large;\">商品說明：</span><br/>\n</div>\n<div><span style=\"font-size: medium;\">．越野+全罩+街帽=多樣組合，變化性隨心所欲。</span></div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">COOLMAX內襯材質，親膚涼感不過敏</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">三段式可拆洗內襯</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">眼鏡溝槽設計</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">預留藍芽耳機槽</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">抗UV-400內墨鏡片</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">雙頰+下巴EPS，防護等級UP</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">帽體加大型通風孔位，可依自身需求進行開關</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">保麗龍通風溝槽加深/ 寬設計，排熱性佳</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">美國DOT、臺灣CNS、日本SG安全檢驗合格</span>\n</div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">M / L / XL / 3XL</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: large;\">尺寸：</span></div>\n<div><span style=\"font-size: medium;\">M:57~58cm<br/>L:59~60cm <br/>XL:61~62cm <br/>3XL:65~66cm </span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">※頭圍測量方法：</span></div>\n<div><span style=\"font-size: medium;\">拿皮尺在眉毛上方約1公分處繞一圈頭部。</span></div>\n<div><span style=\"font-size: medium;\">如果沒有皮尺，可使用棉線等物體代替，在固定測量長度後以尺量得總尺寸。</span></div>\n<div><span style=\"font-size: medium;\">可量測2-3次抓取平均值會比較正確喔。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\">註：每個人頭型較為不同，有些微誤差皆屬於正常喔!</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: large;\">注意事項：</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</div>\n</div></div></body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1350.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64783e691264820023a15216/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64783e691264820023a15216/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64783e691264820023a15216/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64783e691264820023a15216/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1350.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64783e6953c993000eacbb88/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64783e6953c993000eacbb88/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64783e6953c993000eacbb88/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64783e6953c993000eacbb88/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"600.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/647823725fb3316724de5a77/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823725fb3316724de5a77/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823725fb3316724de5a77/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823725fb3316724de5a77/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"600.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64782372bc037c001437f1bb/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64782372bc037c001437f1bb/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64782372bc037c001437f1bb/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64782372bc037c001437f1bb/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"600.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/647823733941a60020856649/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823733941a60020856649/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823733941a60020856649/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823733941a60020856649/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"600.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/647823723ee609000e53307f/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823723ee609000e53307f/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823723ee609000e53307f/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823723ee609000e53307f/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"600.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/647823723941a600148565e6/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823723941a600148565e6/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823723941a600148565e6/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/647823723941a600148565e6/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"600.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64782372596636000e113fc5/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64782372596636000e113fc5/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64782372596636000e113fc5/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64782372596636000e113fc5/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"600.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64782372aa38d00017e5e8a0/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64782372aa38d00017e5e8a0/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64782372aa38d00017e5e8a0/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64782372aa38d00017e5e8a0/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"600.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/6478237215cf370014afea50/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/6478237215cf370014afea50/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/6478237215cf370014afea50/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/6478237215cf370014afea50/900x.jpg? 900w\" width=\"900.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:25:33'),
(13, 21, 'Alpinestars GP TECH V4 連身皮衣', NULL, 63800, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-JXRLJRBX-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div>\n<span style=\"font-size: medium; font-weight: bold;\">GP Tech V4 連身皮衣設計源自 Alpinestars 自家登上頒獎台的車手們給出的反饋， 打造一套充滿競賽級科技、追求最佳表現、防護性及舒適性的皮衣。除了可搭配 Tech-Air® 安全氣囊系統外， 這套皮衣使用了創新的 MATRYX® 輕量纖維布 以提供絕佳的肢體活動自由度、抗磨損能力和透氣性，Cool-iR 科技與 Kevlar® 強化彈性布料結合讓皮衣內部能夠在穿著時保持涼爽、減少熱能傳遞。</span><br/>\n</div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．GP Tech v4 於左前臂處有預留空間可安裝 Tech-Air® 10 安全氣囊系統的LED無線顯示器。</span></div>\n<div><span style=\"font-size: medium;\">．使用 Cool-iR 技術以達到最佳的體溫控制。</span></div>\n<div><span style=\"font-size: medium;\">．適合賽道騎姿的四肢及軀幹版型設計。</span></div>\n<div><span style=\"font-size: medium;\">．GP等級的DFS(動態摩擦護盾技術)護具可降低滑行時的摩擦力，並提供絕佳的撞擊防護及抗磨損能力。</span></div>\n<div><span style=\"font-size: medium;\">．腹部、手臂下方、手臂、胯部和腿後部使用具延展性的 Kevlar® 彈性材質，提升騎乘舒適性。</span></div>\n<div><span style=\"font-size: medium;\">．大腿、腹部、胸部及背枕使用 MATRYX® 輕量纖維布料，極度輕薄外也帶來良好的透氣性。</span></div>\n<div><span style=\"font-size: medium;\">．在活動度較大之處如手臂、臀部及腹部使用袋鼠皮，而競賽級的牛皮則是達到重量減輕、高性能能及高舒適性的絕佳選擇。</span></div>\n<div><span style=\"font-size: medium;\">．新型的舒適短板可拆卸式拉鍊內襯經 Polygiene® 銀離子抗菌技術處理，穿脫方便外，也可防止異味及細菌滋生。</span></div>\n<div><span style=\"font-size: medium;\">．使用競賽等級的 Bioflex Hip Protector 臀部護具來達到最佳的撞擊防護。</span></div>\n<div><span style=\"font-size: medium;\">．可更換膝蓋滑塊。 </span></div>\n<div><span style=\"font-size: medium;\">．手臂及腿部的透氣孔位提供良好的通風性。</span></div>\n<div><span style=\"font-size: medium;\">．內部使用競技規格的 GP-R Lite 軟式護具，兼顧舒適性並提高防護性。 </span></div>\n<div><span style=\"font-size: medium;\">．駝峰設計，改善了空氣力學和通風性。</span></div>\n<div><span style=\"font-size: medium;\">．可配備搭載 Tech-Air®10 系統及其專用的臀部護具(需另購)。</span></div>\n<div><span style=\"font-size: medium;\">．相較 V3 版本輕量化 250 公克(約0.55磅)。</span></div>\n<div><span style=\"font-size: medium;\">．機車騎行防護服AA級(根據Category II prEN17092標準)。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">48 / 50 / 52 / 54 / 56</span></div>\n<div>\n<span style=\"font-size: medium;\">商品編號：3156822</span><br/>\n</div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">注意事項：</span></div>\n<div><span style=\"font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div><span style=\"font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"835.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/661f74d6953f88002158a960/375x.png? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/661f74d6953f88002158a960/540x.png? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/661f74d6953f88002158a960/720x.png? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/661f74d6953f88002158a960/900x.png? 900w\" width=\"835.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:31:38');
INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(14, 22, 'IXON STRIKER AIR WP A 夏季運動風格防摔衣 亞版', NULL, 9380, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-JUQNCDEG-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div>\n<span style=\"font-size: medium;\">．通過服飾類A級CE認證。<br/>．亞洲版型，完全重新設計更適合亞洲人身形。<br/>．全身上下皆採用透氣良好的3D網布。<br/></span><div>\n<span style=\"font-size: medium;\">．可拆卸防水內襯，表層也有防潑水設計，可應付更多氣候狀況</span><br/><span style=\"font-size: medium;\">．七件式護具，背部、胸部預配置IX SOFT泡棉式護具，可升級。</span><br/><span style=\"font-size: medium;\">．胸部可使用CP2 concept扣式護具。</span><span style=\"font-size: medium;\"><br/></span><div><span style=\"font-size: medium;\">．一個內側防水口袋可放置較重要的3C物品。</span></div>\n</div>\n</div>\n<div>\n<span style=\"font-size: medium;\">．肩肘配置IX-PROFLEX SEKA-1 CE護具，打孔設計保護與通風兼顧。<br/></span><div><span style=\"font-size: medium;\">．手臂與背部配置反光條，添加行車安全</span></div>\n</div>\n<div>\n<span style=\"font-size: medium;\">．可安裝Ix Airbag U03氣囊背心(另購) 。</span><br/>\n</div>\n<div><span style=\"font-size: medium;\">     </span></div>\n<div><span style=\"font-size: medium;\">      </span></div>\n<div>\n<span style=\"font-size: large;\">商品規格：<br/></span><span style=\"font-size: medium;\">防水內襯規格 3000 Schmerbers / 2000 MVTR<br/>通過A級認證<br/>肩肘使用CE Lv1護具<br/>背部、胸部使用泡棉護具(可升級)</span>\n</div>\n<div><span style=\"font-size: medium;\">詳見尺寸圖</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: large;\">注意事項：</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"2814.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/63d89158ef8efc000e661d8e/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d89158ef8efc000e661d8e/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d89158ef8efc000e661d8e/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d89158ef8efc000e661d8e/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d89158ef8efc000e661d8e/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d89158ef8efc000e661d8e/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d89158ef8efc000e661d8e/1512x.jpg? 1512w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d89158ef8efc000e661d8e/2160x.jpg? 2160w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d89158ef8efc000e661d8e/2960x.jpg? 2960w\" width=\"2252.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"2814.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/63d891576e1a7000116a172f/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d891576e1a7000116a172f/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d891576e1a7000116a172f/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d891576e1a7000116a172f/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d891576e1a7000116a172f/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d891576e1a7000116a172f/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d891576e1a7000116a172f/1512x.jpg? 1512w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d891576e1a7000116a172f/2160x.jpg? 2160w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d891576e1a7000116a172f/2960x.jpg? 2960w\" width=\"2252.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"955.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/63d88d4d0fd78c001d81edad/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d88d4d0fd78c001d81edad/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d88d4d0fd78c001d81edad/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d88d4d0fd78c001d81edad/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d88d4d0fd78c001d81edad/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d88d4d0fd78c001d81edad/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d88d4d0fd78c001d81edad/1512x.jpg? 1512w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d88d4d0fd78c001d81edad/2160x.jpg? 2160w, https://shoplineimg.com/5be4227a02dd95000178fa71/63d88d4d0fd78c001d81edad/2960x.jpg? 2960w\" width=\"2252.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:31:40'),
(15, 23, 'RS TAICHI 防摔褲 RSY256 網眼透氣防摔褲 CE Lv2護具 男女版', NULL, 6020, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-FLHBTUJA-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body><div>\n<span style=\"font-size: large;\">商品說明：<br/></span><span style=\"font-size: medium;\">．RS TAICHI 獨家 T-DRY 網眼內襯，快乾舒適。<br/></span><div><span style=\"font-size: medium;\">．預設配置CE LEVEL 2(最高級)膝蓋護具，可拆卸置換。<br/></span></div>\n<div>\n<span style=\"font-size: medium;\">．臀部海綿軟墊式護具，可調整升級。<br/></span><div><span style=\"font-size: medium;\">・腰部調節帶，免皮帶調整腰圍更方便。</span></div>\n<div><span style=\"font-size: medium;\">・小腿採用阻燃 Schoeller dynatec 面料，能隔絕引擎熱量。<br/>・腿部有反光插入材料，提高可見度。</span></div>\n<div><span style=\"font-size: medium;\">・配有女款尺寸。</span></div>\n<br/><br/>\n</div>\n<div>\n<div>\n<span style=\"font-size: large;\">商品規格：<br/></span><span style=\"font-size: medium;\">S / M / L / XL / 2XL / WM / WL<br/></span>\n</div>\n<div>\n<span style=\"font-size: medium;\">材質：</span><br/><span style=\"font-size: medium;\">尼龍、滌綸</span><br/>\n</div>\n<div>\n<span style=\"font-size: medium;\">  <br/></span><div><span style=\"font-size: medium;\">  </span></div>\n</div>\n<div>\n<div style=\"max-width: 100%;\"><span style=\"max-width: 100%;\"><span style=\"font-size: large;\">注意事項：</span><br/><span style=\"font-size: medium;\">．進口商品於其他平台同步販售，部分品項須預訂，請先詢問庫存。</span><br/></span></div>\n<div style=\"max-width: 100%;\"><span style=\"max-width: 100%; font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div style=\"max-width: 100%;\"><span style=\"max-width: 100%; font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div style=\"max-width: 100%;\"><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n</div>\n</div>\n</div></body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1125.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64253f3833e1c40023a7ca49/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f3833e1c40023a7ca49/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f3833e1c40023a7ca49/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f3833e1c40023a7ca49/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"609.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37d14ffd00177df5ee/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37d14ffd00177df5ee/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37d14ffd00177df5ee/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37d14ffd00177df5ee/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"900.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37e2d286001472b256/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37e2d286001472b256/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37e2d286001472b256/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37e2d286001472b256/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37e2d286001472b256/1080x.jpg? 1080w\" width=\"901.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"900.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37d20d62001d7b31bd/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37d20d62001d7b31bd/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37d20d62001d7b31bd/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37d20d62001d7b31bd/900x.jpg? 900w\" width=\"900.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"900.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37eda6c3000e01ab73/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37eda6c3000e01ab73/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37eda6c3000e01ab73/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37eda6c3000e01ab73/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/64253f37eda6c3000e01ab73/1080x.jpg? 1080w\" width=\"901.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:34:41'),
(16, 31, 'DAINESE CARBON 4 SHORT 碳纖維防摔手套 可觸控', NULL, 5200, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-ZUOKMHUO-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．主體使用柔軟的山羊皮製成。</span></div>\n<div><span style=\"font-size: medium;\">．拳眼採用碳纖維護具。</span></div>\n<div><span style=\"font-size: medium;\">．手掌外側有塑料滑塊防護。</span></div>\n<div><span style=\"font-size: medium;\">．手掌採用超柔軟Amica麂皮材質。</span></div>\n<div><span style=\"font-size: medium;\">．拇指、食指、手掌處皆採用山羊皮加固。</span></div>\n<div><span style=\"font-size: medium;\">．丹尼斯專利DCP防止小指外翻。</span></div>\n<div><span style=\"font-size: medium;\">．手指預彎曲設計，減少騎乘時的疲勞。</span></div>\n<div><span style=\"font-size: medium;\">．關節處有軟墊加強防護。</span></div>\n<div><span style=\"font-size: medium;\">．手腕魔鬼氈可調節鬆緊。</span></div>\n<div><span style=\"font-size: medium;\">．食指可觸控螢幕。</span></div>\n<div><span style=\"font-size: medium;\">．通過CE Level1認證。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">Dainese 手套規格</span></div>\n<div><span style=\"font-size: medium;\">請用皮尺由虎口測量手掌繞一圈之周長</span></div>\n<div><span style=\"font-size: medium;\">XS：19.1cm</span></div>\n<div><span style=\"font-size: medium;\">S：19.1-20.3cm</span></div>\n<div><span style=\"font-size: medium;\">M：20.3-21.6cm</span></div>\n<div><span style=\"font-size: medium;\">L：21.6-22.9cm</span></div>\n<div><span style=\"font-size: medium;\">XL：22.9-24.1cm </span></div>\n<div><span style=\"font-size: medium;\">2XL：24.1-25.4cm</span></div>\n<div><span style=\"font-size: medium;\">3XL：25.4-26.7cm</span></div>\n<div><br/></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: large;\">注意事項：</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div style=\'font-family: \"Noto Sans TC\", andy-money, \"Noto Sans\", Mitr, Athiti, \"Noto Sans TC\", \"Noto Sans SC\", system-ui, -apple-system, \"Segoe UI\", sans-serif; color: rgb(0, 0, 0);\'><span style=\"font-family: var(--font-family-paragraph); font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1071.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/646c4836af6e3f00119e7ef1/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/646c4836af6e3f00119e7ef1/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/646c4836af6e3f00119e7ef1/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/646c4836af6e3f00119e7ef1/900x.jpg? 900w\" width=\"833.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"1071.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/646c4836d09387000e2967b9/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/646c4836d09387000e2967b9/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/646c4836d09387000e2967b9/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/646c4836d09387000e2967b9/900x.jpg? 900w\" width=\"833.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:35:07'),
(17, 32, 'IXON RS REPLICA 競技長版防摔手套 頂級', NULL, 13800, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-EGTDDWEG-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div>\n<span style=\"font-size: large;\">商品說明：<br/></span><span style=\"font-size: medium;\">．CE認證 Lv1。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">Keprotec Schoeller®超耐磨纖維被置於整個指尖、手掌和手腕上。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．整雙使用DuPont™ Kevlar®纖維內襯。<br/></span><span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">搭載雙密度手背護具</span><span style=\"font-size: medium;\">。</span><br/><span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">標配掌心滑塊與手臂滑塊</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">手掌外側安全強化</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">採用柔軟牛皮革製成</span><span style=\"font-size: medium;\">。</span>\n</div>\n<div>\n<span style=\"font-size: medium;\">．指節大面積彈性材質</span><span style=\"font-size: medium;\">。</span><br/><span style=\"font-size: medium;\">．</span><span style=\"font-size: medium;\">小指有指橋防扭轉結構</span><span style=\"font-size: medium;\">。</span><br/>\n</div>\n<div><span style=\"font-size: medium;\">     </span></div>\n<div><span style=\"font-size: medium;\">      </span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">詳見尺寸圖</span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div><span style=\"font-size: medium;\"> </span></div>\n<div>\n<span style=\"font-size: large;\">注意事項：<br/></span><span style=\"font-size: medium;\">．進口商品於其他平台同步販售，部分品項須預訂，請先詢問庫存。</span><span style=\"font-size: large;\"><br/></span>\n</div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"2813.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d04ad62e65000e713394/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d04ad62e65000e713394/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d04ad62e65000e713394/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d04ad62e65000e713394/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d04ad62e65000e713394/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d04ad62e65000e713394/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d04ad62e65000e713394/1512x.jpg? 1512w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d04ad62e65000e713394/2160x.jpg? 2160w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d04ad62e65000e713394/2960x.jpg? 2960w\" width=\"2251.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"2813.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d0485b42c0000ed1dfa5/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d0485b42c0000ed1dfa5/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d0485b42c0000ed1dfa5/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d0485b42c0000ed1dfa5/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d0485b42c0000ed1dfa5/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d0485b42c0000ed1dfa5/1296x.jpg? 1296w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d0485b42c0000ed1dfa5/1512x.jpg? 1512w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d0485b42c0000ed1dfa5/2160x.jpg? 2160w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8d0485b42c0000ed1dfa5/2960x.jpg? 2960w\" width=\"2251.0\"/> </li> <li> <img alt=\"\" class=\"sl-lazy\" height=\"537.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/63c8ca52ade97c0011420ede/375x.jpg? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8ca52ade97c0011420ede/540x.jpg? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8ca52ade97c0011420ede/720x.jpg? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8ca52ade97c0011420ede/900x.jpg? 900w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8ca52ade97c0011420ede/1080x.jpg? 1080w, https://shoplineimg.com/5be4227a02dd95000178fa71/63c8ca52ade97c0011420ede/1296x.jpg? 1296w\" width=\"1200.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:35:51'),
(18, 33, 'Alpinestars Wt-4 Gore-Tex Insulated 防摔手套', NULL, 4580, 1, '<div class=\"Tab-content js-tab-content active\" id=\"tabset-tab-CMCCEVXC-1\" scroll-offset=\"48\" scroll-to=\"\"> <div class=\"ProductDetail-description\"> <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>\n<!-- START SHOPLINE RICH CONTENT -->\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n\n<html><body>\n<div><span style=\"font-size: medium; font-weight: bold;\">中長型 WT-4 GORE-TEX 手套經過專門優化，可提供卓越的全天候旅行舒適感，</span></div>\n<div><span style=\"font-size: medium; font-weight: bold;\">採用GORE-TEX 結構，具有出色的防水性和高水平的透氣性，</span></div>\n<div><span style=\"font-size: medium; font-weight: bold;\">並具有輕質、透氣的 PrimaLoft® SILVER 絕緣材料反手防潮，同時為寒冷天氣騎乘提供卓越性能。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品說明：</span></div>\n<div><span style=\"font-size: medium;\">．GORE-TEX 結構具有卓越的防水性能。</span></div>\n<div><span style=\"font-size: medium;\">．配備 GORE GRIP，帶來卓越的靈敏度和握持感。</span></div>\n<div><span style=\"font-size: medium;\">．80 克 PrimaLoft® 銀隔熱主動保暖，使多餘的熱量和濕氣排出，讓騎手在寒冷條件下保持舒適和乾燥。</span></div>\n<div><span style=\"font-size: medium;\">．中長袖口設計提供溫暖和舒適感。</span></div>\n<div><span style=\"font-size: medium;\">．頂級彈性織物結構，可實現最佳舒適度和精確貼合。</span></div>\n<div><span style=\"font-size: medium;\">．GORE-TEX 結構提供卓越的防水性能，皮革手掌和側壁增加了耐磨性。</span></div>\n<div><span style=\"font-size: medium;\">．配備 GORE GRIP，提供卓越的靈敏度和握持感。</span></div>\n<div><span style=\"font-size: medium;\">．80 克 PrimaLoft® Silver Insulation Active 讓騎士在寒冷天氣中保持溫暖和乾燥。</span></div>\n<div><span style=\"font-size: medium;\">．中長袖口設計經過精心設計，提供溫暖和舒適度。</span></div>\n<div><span style=\"font-size: medium;\">．彈性織物結構，提供最佳的騎乘舒適度和精確的貼合度。</span></div>\n<div><span style=\"font-size: medium;\">．帶有擴展板的預彎曲手指可增強靈活性，同時有助於減少長途騎行時的疲勞。</span></div>\n<div><span style=\"font-size: medium;\">．指尖捏緊設計減少了接縫數量，帶來更好的舒適度。</span></div>\n<div><span style=\"font-size: medium;\">．盒裝拇指設計，讓騎乘者倍感舒適。</span></div>\n<div><span style=\"font-size: medium;\">．拇指和食指上嵌有導電合成皮革，可觸控手機及GPS。</span></div>\n<div><span style=\"font-size: medium;\">．袖口上有矽膠握把細節，方便使用。</span></div>\n<div><span style=\"font-size: medium;\">．皮革手掌和側壁具有卓越的耐磨性，橡膠手掌抓握貼片可提供精確的手感並增強耐用性。</span></div>\n<div><span style=\"font-size: medium;\">．SP 指節採用織物覆蓋，可提供經過驗證的衝擊保護。</span></div>\n<div><span style=\"font-size: medium;\">．內部手掌襯墊策略性地位於著陸區域，以提供額外的覆蓋範圍。</span></div>\n<div><span style=\"font-size: medium;\">．在手指和拇指上放置衝擊墊，以在關鍵區域提供額外的覆蓋。</span></div>\n<div><span style=\"font-size: medium;\">．CE 認證的摩托車產品：CE 1 級 KP。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">商品規格：</span></div>\n<div><span style=\"font-size: medium;\">尺寸請參考圖示說明。</span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: medium;\"><br/></span></div>\n<div><span style=\"font-size: large;\">注意事項：</span></div>\n<div><span style=\"font-size: medium;\">．商品變動快速，可先詢問庫存。</span></div>\n<div><span style=\"font-size: medium;\">．超商取貨有積材限制，欲購買一頂安全帽以上須分2筆訂單。</span></div>\n<div><span style=\"font-size: medium;\">．每款螢幕色調不同，商品難免有些許色差，以原廠實際商品為主。</span></div>\n<div><span style=\"font-size: medium;\">．網路購物皆享有鑑賞期(非試用期)，商品經拆封使用無法退換貨，還請見諒。</span></div>\n<div><span style=\"font-size: medium;\">．如要到門市購買，請先和客服詢問庫存情況，以免造成雙方不便。</span></div>\n</body></html>\n<!-- END SHOPLINE RICH CONTENT -->\n</div> <div class=\"ProductDetail-gallery\"> <div class=\"ProductDetail-title primary-border-color-after\">                  了解更多                </div> <ul> <li> <img alt=\"\" class=\"sl-lazy\" height=\"800.0\" sizes=\"auto\" src=\"https://shoplineimg.com/5be4227a02dd95000178fa71/65fa9a383d2cc60014b358d6/375x.png? 375w, https://shoplineimg.com/5be4227a02dd95000178fa71/65fa9a383d2cc60014b358d6/540x.png? 540w, https://shoplineimg.com/5be4227a02dd95000178fa71/65fa9a383d2cc60014b358d6/720x.png? 720w, https://shoplineimg.com/5be4227a02dd95000178fa71/65fa9a383d2cc60014b358d6/900x.png? 900w\" width=\"799.0\"/> </li> </ul> </div> </div>', '2025-01-23 06:36:21');

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int(11) NOT NULL COMMENT '圖檔編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `img_file` varchar(100) NOT NULL COMMENT '圖檔名稱',
  `sort` int(2) NOT NULL COMMENT '圖片順序',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product_img`
--

INSERT INTO `product_img` (`img_id`, `p_id`, `img_file`, `sort`, `create_date`) VALUES
(1, 1, 'Arai Astro-GX 素色 全罩式安全帽.webp', 1, '2025-01-24 08:01:31'),
(2, 2, 'SHOEI GT-Air 3 素色 全罩安全帽.webp', 1, '2025-01-24 08:02:36'),
(3, 3, 'SHOEI X-Fifteen X-15 素色 全罩式安全帽 頂級款 X15.webp', 1, '2025-01-24 08:02:53'),
(4, 4, 'SHOEI Z-8 素色 SOLID 全罩式安全帽 輕量 Z8.webp', 1, '2025-01-24 23:02:42'),
(5, 5, 'Arai VZ-RAM 素色 半罩式安全帽.webp', 1, '2025-01-24 23:04:31'),
(6, 6, 'ASTONE DJ15 素色 半罩安全帽.webp', 1, '2025-01-24 23:05:00'),
(7, 7, 'OGK EXCEED 素色 半罩安全帽 KABUTO.webp', 1, '2025-01-24 23:05:48'),
(8, 8, 'Arai VZ-RAM NAKAGAMI GP2 中上貴晶 選手彩繪 半罩式安全帽.webp', 1, '2025-01-24 23:05:52'),
(9, 9, 'Scorpion VX-16 Air 彩繪 FUSION 越野帽 安全帽.webp', 1, '2025-01-24 23:06:41'),
(10, 10, 'SHOEI VFX-WR 素色 越野式安全帽.webp', 1, '2025-01-24 23:06:59'),
(11, 11, 'Airoh TWIST 3.0 彩繪 4 越野帽 安全帽.webp', 1, '2025-01-24 23:07:47'),
(12, 12, 'NIKKO N-851 EVA 新世紀福音戰士 限量聯名款 13號機 多功能 越野安全帽.webp', 1, '2025-01-24 23:09:07'),
(13, 13, 'Alpinestars GP TECH V4 連身皮衣.webp', 1, '2025-01-24 23:09:05'),
(14, 14, 'IXON STRIKER AIR WP A 夏季運動風格防摔衣 亞版.webp', 1, '2025-01-24 23:10:10'),
(15, 15, 'RS TAICHI 防摔褲 RSY256 網眼透氣防摔褲 CE Lv2護具 男女版.webp', 1, '2025-01-24 23:10:15'),
(16, 16, 'DAINESE CARBON 4 SHORT 碳纖維防摔手套 可觸控.webp', 1, '2025-01-24 23:11:02'),
(17, 17, 'IXON RS REPLICA 競技長版防摔手套 頂級.webp', 1, '2025-01-24 23:11:03'),
(18, 18, 'Alpinestars Wt-4 Gore-Tex Insulated 防摔手套.webp', 1, '2025-01-24 23:11:41'),
(19, 1, 'Arai Astro-GX 素色 全罩式安全帽1.webp', 2, '2025-02-04 05:55:24'),
(20, 2, 'SHOEI GT-Air 3 素色 全罩安全帽1.webp', 2, '2025-02-04 05:55:45'),
(21, 3, 'SHOEI X-Fifteen X-15 素色 全罩式安全帽 頂級款 X151.webp', 2, '2025-02-04 05:57:08'),
(22, 4, 'SHOEI Z-8 素色 SOLID 全罩式安全帽 輕量 Z81.webp', 2, '2025-02-04 05:57:09'),
(23, 5, 'Arai VZ-RAM 素色 半罩式安全帽1.webp', 2, '2025-02-04 05:57:44'),
(24, 6, 'ASTONE DJ15 素色 半罩安全帽1.webp', 2, '2025-02-04 05:57:46'),
(25, 8, 'Arai VZ-RAM NAKAGAMI GP2 中上貴晶 選手彩繪 半罩式安全帽1.webp', 2, '2025-02-04 05:58:23'),
(26, 9, 'Scorpion VX-16 Air 彩繪 FUSION 越野帽 安全帽1.webp', 2, '2025-02-04 05:58:55'),
(27, 10, 'SHOEI VFX-WR 素色 越野式安全帽1.webp', 2, '2025-02-04 05:59:58'),
(28, 12, 'NIKKO N-851 EVA 新世紀福音戰士 限量聯名款 13號機 多功能 越野安全帽1.webp', 2, '2025-02-04 05:59:58'),
(29, 13, 'Alpinestars GP TECH V4 連身皮衣1.webp', 2, '2025-02-04 06:00:26'),
(30, 14, 'IXON STRIKER AIR WP A 夏季運動風格防摔衣 亞版1.webp', 2, '2025-02-04 06:00:39'),
(31, 15, 'RS TAICHI 防摔褲 RSY256 網眼透氣防摔褲 CE Lv2護具 男女版1.webp', 2, '2025-02-04 06:01:12'),
(32, 16, 'DAINESE CARBON 4 SHORT 碳纖維防摔手套 可觸控1.webp', 2, '2025-02-04 06:01:27'),
(33, 17, 'IXON RS REPLICA 競技長版防摔手套 頂級1.webp', 2, '2025-02-04 06:01:48'),
(34, 18, 'Alpinestars Wt-4 Gore-Tex Insulated 防摔手套1.webp', 2, '2025-02-04 06:01:51');

-- --------------------------------------------------------

--
-- 資料表結構 `pyclass`
--

CREATE TABLE `pyclass` (
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `level` int(2) NOT NULL COMMENT '所在層級',
  `fonticon` varchar(30) NOT NULL COMMENT '字型圖示',
  `cname` varchar(30) NOT NULL COMMENT '類別名稱',
  `sort` int(3) NOT NULL COMMENT '列表排序',
  `uplink` int(3) NOT NULL COMMENT '上層連結',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '建立時間與更新時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `pyclass`
--

INSERT INTO `pyclass` (`classid`, `level`, `fonticon`, `cname`, `sort`, `uplink`, `create_date`) VALUES
(1, 1, '', '安全帽', 1, 0, '2025-01-23 04:53:17'),
(2, 1, '', '防摔衣', 2, 0, '2025-01-23 04:53:32'),
(3, 1, '', '防摔手套', 3, 0, '2025-01-23 04:53:48'),
(11, 2, '', '全罩帽', 1, 1, '2025-01-23 05:00:00'),
(12, 2, '', '3/4帽', 2, 1, '2025-01-23 05:00:08'),
(13, 2, '', '越野帽', 3, 1, '2025-01-23 05:00:16'),
(21, 2, '', '全身防摔衣', 1, 2, '2025-01-23 05:01:32'),
(22, 2, '', '防摔外套', 2, 2, '2025-01-23 05:01:40'),
(23, 2, '', '防摔褲', 3, 2, '2025-01-23 05:01:46'),
(31, 2, '', '短手套', 1, 3, '2025-01-23 05:02:35'),
(32, 2, '', '長手套', 2, 3, '2025-01-23 05:03:18'),
(33, 2, '', '防水手套', 3, 3, '2025-01-23 05:03:55'),
(41, 2, '', '保養蠟/矽油', 1, 4, '2025-02-03 01:36:11'),
(42, 2, '', '清潔劑/乾洗劑', 2, 4, '2025-02-03 01:35:39'),
(43, 2, '', '海綿/柔刷', 3, 4, '2025-02-03 01:36:16'),
(4, 1, '', '清潔用品', 4, 0, '2025-02-03 01:33:43');

-- --------------------------------------------------------

--
-- 資料表結構 `town`
--

CREATE TABLE `town` (
  `townNo` bigint(20) NOT NULL COMMENT '鄕鎮市編號',
  `Name` varchar(150) NOT NULL COMMENT '鄕鎮市名稱',
  `Post` varchar(10) NOT NULL COMMENT '郵遞區號',
  `State` smallint(6) NOT NULL COMMENT '狀態',
  `AutoNo` int(10) NOT NULL COMMENT '上層城市編號連結'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `town`
--

INSERT INTO `town` (`townNo`, `Name`, `Post`, `State`, `AutoNo`) VALUES
(1, '中正區', '100', 0, 1),
(2, '大同區', '103', 0, 1),
(3, '中山區', '104', 0, 1),
(4, '松山區', '105', 0, 1),
(5, '大安區', '106', 0, 1),
(6, '萬華區', '108', 0, 1),
(7, '信義區', '110', 0, 1),
(8, '士林區', '111', 0, 1),
(9, '北投區', '112', 0, 1),
(10, '內湖區', '114', 0, 1),
(11, '南港區', '115', 0, 1),
(12, '文山區', '116', 0, 1),
(13, '仁愛區', '200', 0, 2),
(14, '信義區', '201', 0, 2),
(15, '中正區', '202', 0, 2),
(16, '中山區', '203', 0, 2),
(17, '安樂區', '204', 0, 2),
(18, '暖暖區', '205', 0, 2),
(19, '七堵區', '206', 0, 2),
(20, '萬里區', '207', 0, 3),
(21, '金山區', '208', 0, 3),
(22, '板橋區', '220', 0, 3),
(23, '汐止區', '221', 0, 3),
(24, '深坑區', '222', 0, 3),
(25, '石碇區', '223', 0, 3),
(26, '瑞芳區', '224', 0, 3),
(27, '平溪區', '226', 0, 3),
(28, '雙溪區', '227', 0, 3),
(29, '貢寮區', '228', 0, 3),
(30, '新店區', '231', 0, 3),
(31, '坪林區', '232', 0, 3),
(32, '烏來區', '233', 0, 3),
(33, '永和區', '234', 0, 3),
(34, '中和區', '235', 0, 3),
(35, '土城區', '236', 0, 3),
(36, '三峽區', '237', 0, 3),
(37, '樹林區', '238', 0, 3),
(38, '鶯歌區', '239', 0, 3),
(39, '三重區', '241', 0, 3),
(40, '新莊區', '242', 0, 3),
(41, '泰山區', '243', 0, 3),
(42, '林口區', '244', 0, 3),
(43, '蘆洲區', '247', 0, 3),
(44, '五股區', '248', 0, 3),
(45, '八里區', '249', 0, 3),
(46, '淡水區', '251', 0, 3),
(47, '三芝區', '252', 0, 3),
(48, '石門區', '253', 0, 3),
(49, '宜蘭市', '260', 0, 4),
(50, '頭城鎮', '261', 0, 4),
(51, '礁溪鄉', '262', 0, 4),
(52, '壯圍鄉', '263', 0, 4),
(53, '員山鄉', '264', 0, 4),
(54, '羅東鎮', '265', 0, 4),
(55, '三星鄉', '266', 0, 4),
(56, '大同鄉', '267', 0, 4),
(57, '五結鄉', '268', 0, 4),
(58, '冬山鄉', '269', 0, 4),
(59, '蘇澳鎮', '270', 0, 4),
(60, '南澳鄉', '272', 0, 4),
(61, '釣魚台列嶼', '290', 0, 4),
(62, '新竹市(東區)', '300', 0, 5),
(63, '竹北市', '302', 0, 6),
(64, '湖口鄉', '303', 0, 6),
(65, '新豐鄉', '304', 0, 6),
(66, '新埔鎮', '305', 0, 6),
(67, '關西鎮', '306', 0, 6),
(68, '芎林鄉', '307', 0, 6),
(69, '寶山鄉', '308', 0, 6),
(70, '竹東鎮', '310', 0, 6),
(71, '五峰鄉', '311', 0, 6),
(72, '橫山鄉', '312', 0, 6),
(73, '尖石鄉', '313', 0, 6),
(74, '北埔鄉', '314', 0, 6),
(75, '峨眉鄉', '315', 0, 6),
(76, '中壢區', '320', 0, 7),
(77, '平鎮區', '324', 0, 7),
(78, '龍潭區', '325', 0, 7),
(79, '楊梅區', '326', 0, 7),
(80, '新屋區', '327', 0, 7),
(81, '觀音區', '328', 0, 7),
(82, '桃園區', '330', 0, 7),
(83, '龜山區', '333', 0, 7),
(84, '八德區', '334', 0, 7),
(85, '大溪區', '335', 0, 7),
(86, '復興區', '336', 0, 7),
(87, '大園區', '337', 0, 7),
(88, '蘆竹區', '338', 0, 7),
(89, '竹南鎮', '350', 0, 8),
(90, '頭份市', '351', 0, 8),
(91, '三灣鄉', '352', 0, 8),
(92, '南庄鄉', '353', 0, 8),
(93, '獅潭鄉', '354', 0, 8),
(94, '後龍鎮', '356', 0, 8),
(95, '通霄鎮', '357', 0, 8),
(96, '苑裡鎮', '358', 0, 8),
(97, '苗栗市', '360', 0, 8),
(98, '造橋鄉', '361', 0, 8),
(99, '頭屋鄉', '362', 0, 8),
(100, '公館鄉', '363', 0, 8),
(101, '大湖鄉', '364', 0, 8),
(102, '泰安鄉', '365', 0, 8),
(103, '銅鑼鄉', '366', 0, 8),
(104, '三義鄉', '367', 0, 8),
(105, '西湖鄉', '368', 0, 8),
(106, '卓蘭鎮', '369', 0, 8),
(107, '中區', '400', 0, 9),
(108, '東區', '401', 0, 9),
(109, '南區', '402', 0, 9),
(110, '西區', '403', 0, 9),
(111, '北區', '404', 0, 9),
(112, '北屯區', '406', 0, 9),
(113, '西屯區', '407', 0, 9),
(114, '南屯區', '408', 0, 9),
(115, '太平區', '411', 0, 9),
(116, '大里區', '412', 0, 9),
(117, '霧峰區', '413', 0, 9),
(118, '烏日區', '414', 0, 9),
(119, '豐原區', '420', 0, 9),
(120, '后里區', '421', 0, 9),
(121, '石岡區', '422', 0, 9),
(122, '東勢區', '423', 0, 9),
(123, '和平區', '424', 0, 9),
(124, '新社區', '426', 0, 9),
(125, '潭子區', '427', 0, 9),
(126, '大雅區', '428', 0, 9),
(127, '神岡區', '429', 0, 9),
(128, '大肚區', '432', 0, 9),
(129, '沙鹿區', '433', 0, 9),
(130, '龍井區', '434', 0, 9),
(131, '梧棲區', '435', 0, 9),
(132, '清水區', '436', 0, 9),
(133, '大甲區', '437', 0, 9),
(134, '外埔區', '438', 0, 9),
(135, '大安區', '439', 0, 9),
(136, '彰化市', '500', 0, 10),
(137, '芬園鄉', '502', 0, 10),
(138, '花壇鄉', '503', 0, 10),
(139, '秀水鄉', '504', 0, 10),
(140, '鹿港鎮', '505', 0, 10),
(141, '福興鄉', '506', 0, 10),
(142, '線西鄉', '507', 0, 10),
(143, '和美鎮', '508', 0, 10),
(144, '伸港鄉', '509', 0, 10),
(145, '員林市', '510', 0, 10),
(146, '社頭鄉', '511', 0, 10),
(147, '永靖鄉', '512', 0, 10),
(148, '埔心鄉', '513', 0, 10),
(149, '溪湖鎮', '514', 0, 10),
(150, '大村鄉', '515', 0, 10),
(151, '埔鹽鄉', '516', 0, 10),
(152, '田中鎮', '520', 0, 10),
(153, '北斗鎮', '521', 0, 10),
(154, '田尾鄉', '522', 0, 10),
(155, '埤頭鄉', '523', 0, 10),
(156, '溪州鄉', '524', 0, 10),
(157, '竹塘鄉', '525', 0, 10),
(158, '二林鎮', '526', 0, 10),
(159, '大城鄉', '527', 0, 10),
(160, '芳苑鄉', '528', 0, 10),
(161, '二水鄉', '530', 0, 10),
(162, '南投市', '540', 0, 11),
(163, '中寮鄉', '541', 0, 11),
(164, '草屯鎮', '542', 0, 11),
(165, '國姓鄉', '544', 0, 11),
(166, '埔里鎮', '545', 0, 11),
(167, '仁愛鄉', '546', 0, 11),
(168, '名間鄉', '551', 0, 11),
(169, '集集鎮', '552', 0, 11),
(170, '水里鄉', '553', 0, 11),
(171, '魚池鄉', '555', 0, 11),
(172, '信義鄉', '556', 0, 11),
(173, '竹山鎮', '557', 0, 11),
(174, '鹿谷鄉', '558', 0, 11),
(175, '斗南鎮', '630', 0, 12),
(176, '大埤鄉', '631', 0, 12),
(177, '虎尾鎮', '632', 0, 12),
(178, '土庫鎮', '633', 0, 12),
(179, '褒忠鄉', '634', 0, 12),
(180, '東勢鄉', '635', 0, 12),
(181, '臺西鄉', '636', 0, 12),
(182, '崙背鄉', '637', 0, 12),
(183, '麥寮鄉', '638', 0, 12),
(184, '斗六市', '640', 0, 12),
(185, '林內鄉', '643', 0, 12),
(186, '古坑鄉', '646', 0, 12),
(187, '莿桐鄉', '647', 0, 12),
(188, '西螺鎮', '648', 0, 12),
(189, '二崙鄉', '649', 0, 12),
(190, '北港鎮', '651', 0, 12),
(191, '水林鄉', '652', 0, 12),
(192, '口湖鄉', '653', 0, 12),
(193, '四湖鄉', '654', 0, 12),
(194, '元長鄉', '655', 0, 12),
(195, '嘉義市(東區)', '600', 0, 13),
(196, '番路鄉', '602', 0, 14),
(197, '梅山鄉', '603', 0, 14),
(198, '竹崎鄉', '604', 0, 14),
(199, '阿里山鄉', '605', 0, 14),
(200, '中埔鄉', '606', 0, 14),
(201, '大埔鄉', '607', 0, 14),
(202, '水上鄉', '608', 0, 14),
(203, '鹿草鄉', '611', 0, 14),
(204, '太保市', '612', 0, 14),
(205, '朴子市', '613', 0, 14),
(206, '東石鄉', '614', 0, 14),
(207, '六腳鄉', '615', 0, 14),
(208, '新港鄉', '616', 0, 14),
(209, '民雄鄉', '621', 0, 14),
(210, '大林鎮', '622', 0, 14),
(211, '溪口鄉', '623', 0, 14),
(212, '義竹鄉', '624', 0, 14),
(213, '布袋鎮', '625', 0, 14),
(214, '中西區', '700', 0, 15),
(215, '東區', '701', 0, 15),
(216, '南區', '702', 0, 15),
(217, '北區', '704', 0, 15),
(218, '安平區', '708', 0, 15),
(219, '安南區', '709', 0, 15),
(220, '永康區', '710', 0, 15),
(221, '歸仁區', '711', 0, 15),
(222, '新化區', '712', 0, 15),
(223, '左鎮區', '713', 0, 15),
(224, '玉井區', '714', 0, 15),
(225, '楠西區', '715', 0, 15),
(226, '南化區', '716', 0, 15),
(227, '仁德區', '717', 0, 15),
(228, '關廟區', '718', 0, 15),
(229, '龍崎區', '719', 0, 15),
(230, '官田區', '720', 0, 15),
(231, '麻豆區', '721', 0, 15),
(232, '佳里區', '722', 0, 15),
(233, '西港區', '723', 0, 15),
(234, '七股區', '724', 0, 15),
(235, '將軍區', '725', 0, 15),
(236, '學甲區', '726', 0, 15),
(237, '北門區', '727', 0, 15),
(238, '新營區', '730', 0, 15),
(239, '後壁區', '731', 0, 15),
(240, '白河區', '732', 0, 15),
(241, '東山區', '733', 0, 15),
(242, '六甲區', '734', 0, 15),
(243, '下營區', '735', 0, 15),
(244, '柳營區', '736', 0, 15),
(245, '鹽水區', '737', 0, 15),
(246, '善化區', '741', 0, 15),
(247, '大內區', '742', 0, 15),
(248, '山上區', '743', 0, 15),
(249, '新市區', '744', 0, 15),
(250, '安定區', '745', 0, 15),
(251, '新興區', '800', 0, 16),
(252, '前金區', '801', 0, 16),
(253, '苓雅區', '802', 0, 16),
(254, '鹽埕區', '803', 0, 16),
(255, '鼓山區', '804', 0, 16),
(256, '旗津區', '805', 0, 16),
(257, '前鎮區', '806', 0, 16),
(258, '三民區', '807', 0, 16),
(259, '楠梓區', '811', 0, 16),
(260, '小港區', '812', 0, 16),
(261, '左營區', '813', 0, 16),
(262, '仁武區', '814', 0, 16),
(263, '大社區', '815', 0, 16),
(264, '岡山區', '820', 0, 16),
(265, '路竹區', '821', 0, 16),
(266, '阿蓮區', '822', 0, 16),
(267, '田寮區', '823', 0, 16),
(268, '燕巢區', '824', 0, 16),
(269, '橋頭區', '825', 0, 16),
(270, '梓官區', '826', 0, 16),
(271, '彌陀區', '827', 0, 16),
(272, '永安區', '828', 0, 16),
(273, '湖內區', '829', 0, 16),
(274, '鳳山區', '830', 0, 16),
(275, '大寮區', '831', 0, 16),
(276, '林園區', '832', 0, 16),
(277, '鳥松區', '833', 0, 16),
(278, '大樹區', '840', 0, 16),
(279, '旗山區', '842', 0, 16),
(280, '美濃區', '843', 0, 16),
(281, '六龜區', '844', 0, 16),
(282, '內門區', '845', 0, 16),
(283, '杉林區', '846', 0, 16),
(284, '甲仙區', '847', 0, 16),
(285, '桃源區', '848', 0, 16),
(286, '那瑪夏區', '849', 0, 16),
(287, '茂林區', '851', 0, 16),
(288, '茄萣區', '852', 0, 16),
(289, '東沙', '817', 0, 17),
(290, '南沙', '819', 0, 17),
(291, '馬公市', '880', 0, 18),
(292, '西嶼鄉', '881', 0, 18),
(293, '望安鄉', '882', 0, 18),
(294, '七美鄉', '883', 0, 18),
(295, '白沙鄉', '884', 0, 18),
(296, '湖西鄉', '885', 0, 18),
(297, '屏東市', '900', 0, 19),
(298, '三地門鄉', '901', 0, 19),
(299, '霧臺鄉', '902', 0, 19),
(300, '瑪家鄉', '903', 0, 19),
(301, '九如鄉', '904', 0, 19),
(302, '里港鄉', '905', 0, 19),
(303, '高樹鄉', '906', 0, 19),
(304, '鹽埔鄉', '907', 0, 19),
(305, '長治鄉', '908', 0, 19),
(306, '麟洛鄉', '909', 0, 19),
(307, '竹田鄉', '911', 0, 19),
(308, '內埔鄉', '912', 0, 19),
(309, '萬丹鄉', '913', 0, 19),
(310, '潮州鎮', '920', 0, 19),
(311, '泰武鄉', '921', 0, 19),
(312, '來義鄉', '922', 0, 19),
(313, '萬巒鄉', '923', 0, 19),
(314, '崁頂鄉', '924', 0, 19),
(315, '新埤鄉', '925', 0, 19),
(316, '南州鄉', '926', 0, 19),
(317, '林邊鄉', '927', 0, 19),
(318, '東港鄉', '928', 0, 19),
(319, '琉球鄉', '929', 0, 19),
(320, '佳冬鄉', '931', 0, 19),
(321, '新園鄉', '932', 0, 19),
(322, '枋寮鄉', '940', 0, 19),
(323, '枋山鄉', '941', 0, 19),
(324, '春日鄉', '942', 0, 19),
(325, '獅子鄉', '943', 0, 19),
(326, '車城鄉', '944', 0, 19),
(327, '牡丹鄉', '945', 0, 19),
(328, '恆春鎮', '946', 0, 19),
(329, '滿州鄉', '947', 0, 19),
(330, '臺東市', '950', 0, 20),
(331, '綠島鄉', '951', 0, 20),
(332, '蘭嶼鄉', '952', 0, 20),
(333, '延平鄉', '953', 0, 20),
(334, '卑南鄉', '954', 0, 20),
(335, '鹿野鄉', '955', 0, 20),
(336, '關山鎮', '956', 0, 20),
(337, '海端鄉', '957', 0, 20),
(338, '池上鄉', '958', 0, 20),
(339, '東河鄉', '959', 0, 20),
(340, '成功鎮', '961', 0, 20),
(341, '長濱鄉', '962', 0, 20),
(342, '太麻里鄉', '963', 0, 20),
(343, '金峰鄉', '964', 0, 20),
(344, '大武鄉', '965', 0, 20),
(345, '達仁鄉', '966', 0, 20),
(346, '花蓮市', '970', 0, 21),
(347, '新城鄉', '971', 0, 21),
(348, '秀林鄉', '972', 0, 21),
(349, '吉安鄉', '973', 0, 21),
(350, '壽豐鄉', '974', 0, 21),
(351, '鳳林鎮', '975', 0, 21),
(352, '光復鄉', '976', 0, 21),
(353, '豐濱鄉', '977', 0, 21),
(354, '瑞穗鄉', '978', 0, 21),
(355, '萬榮鄉', '979', 0, 21),
(356, '玉里鎮', '981', 0, 21),
(357, '卓溪鄉', '982', 0, 21),
(358, '富里鄉', '983', 0, 21),
(359, '金沙鎮', '890', 0, 22),
(360, '金湖鎮', '891', 0, 22),
(361, '金寧鄉', '892', 0, 22),
(362, '金城鎮', '893', 0, 22),
(363, '烈嶼鄉', '894', 0, 22),
(364, '烏坵鄉', '896', 0, 22),
(365, '南竿鄉', '209', 0, 23),
(366, '北竿鄉', '210', 0, 23),
(367, '莒光鄉', '211', 0, 23),
(368, '東引鄉', '212', 0, 23),
(371, '新竹市(北區)', '300', 0, 5),
(372, '新竹市(香山區)', '300', 0, 5),
(373, '嘉義市(西區)', '600', 0, 13);

-- --------------------------------------------------------

--
-- 資料表結構 `uorder`
--

CREATE TABLE `uorder` (
  `orderid` varchar(30) NOT NULL COMMENT '訂單編號',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `addressid` int(10) NOT NULL COMMENT '收件人編號',
  `howpay` tinyint(4) NOT NULL DEFAULT 1 COMMENT '如何付款',
  `paystatus` int(5) DEFAULT NULL COMMENT '付款狀態',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '訂單處理狀態',
  `remark` varchar(200) DEFAULT NULL COMMENT '備註',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '訂單時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `uorder`
--

INSERT INTO `uorder` (`orderid`, `emailid`, `addressid`, `howpay`, `paystatus`, `status`, `remark`, `create_date`) VALUES
('2025030711393765410', 12, 7, 3, 35, 7, NULL, '2025-03-07 03:39:37'),
('2025030711435988056', 12, 7, 3, 35, 7, NULL, '2025-03-07 03:43:59'),
('2025030711490323235', 12, 8, 3, 35, 7, NULL, '2025-03-07 03:49:03'),
('2025031001432751162', 4, 6, 3, 35, 7, NULL, '2025-03-10 05:43:27'),
('2025031001435028286', 4, 5, 3, 35, 7, NULL, '2025-03-10 05:43:50'),
('2025031002005213954', 4, 5, 3, 35, 7, NULL, '2025-03-10 06:00:52'),
('2025031002010590001', 4, 5, 3, 35, 7, NULL, '2025-03-10 06:01:05'),
('2025031002011743440', 4, 5, 3, 35, 7, NULL, '2025-03-10 06:01:17'),
('2025031002013173739', 4, 5, 3, 35, 7, NULL, '2025-03-10 06:01:31');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `addbook`
--
ALTER TABLE `addbook`
  ADD PRIMARY KEY (`addressid`);

--
-- 資料表索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`caro_id`);

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- 資料表索引 `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`AutoNo`);

--
-- 資料表索引 `hot`
--
ALTER TABLE `hot`
  ADD PRIMARY KEY (`h_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`emailid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 資料表索引 `multiselect`
--
ALTER TABLE `multiselect`
  ADD PRIMARY KEY (`msid`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`);

--
-- 資料表索引 `pyclass`
--
ALTER TABLE `pyclass`
  ADD PRIMARY KEY (`classid`);

--
-- 資料表索引 `town`
--
ALTER TABLE `town`
  ADD PRIMARY KEY (`townNo`);

--
-- 資料表索引 `uorder`
--
ALTER TABLE `uorder`
  ADD PRIMARY KEY (`orderid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addbook`
--
ALTER TABLE `addbook`
  MODIFY `addressid` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址ID', AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `carousel`
--
ALTER TABLE `carousel`
  MODIFY `caro_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '輪播編號', AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(10) NOT NULL AUTO_INCREMENT COMMENT '購物車編號', AUTO_INCREMENT=34;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `city`
--
ALTER TABLE `city`
  MODIFY `AutoNo` int(10) NOT NULL AUTO_INCREMENT COMMENT '城市編號', AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hot`
--
ALTER TABLE `hot`
  MODIFY `h_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '熱銷商品流水號', AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `emailid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'email流水號', AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `multiselect`
--
ALTER TABLE `multiselect`
  MODIFY `msid` int(5) NOT NULL AUTO_INCREMENT COMMENT '多功能選擇ID', AUTO_INCREMENT=39;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '產品編號', AUTO_INCREMENT=19;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '圖檔編號', AUTO_INCREMENT=35;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pyclass`
--
ALTER TABLE `pyclass`
  MODIFY `classid` int(3) NOT NULL AUTO_INCREMENT COMMENT '產品類別', AUTO_INCREMENT=118;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `town`
--
ALTER TABLE `town`
  MODIFY `townNo` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '鄕鎮市編號', AUTO_INCREMENT=374;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
