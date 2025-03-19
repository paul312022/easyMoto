//                    首頁安全帽 防摔衣 防摔手套滑鼠移入的影片效果(自己的影片)
//------------------------------------------------------------------------------------------

//            取得DOM元素

// (Document Object Model:文件物件模型 簡單來說 就是將HTML的各個標籤定義成物件 最終會變成樹狀結構)
const videoBackground = document.getElementById('video-background');
const helmetLink = document.getElementById('video_helmet_link');
const suitLink = document.getElementById('video_suit_link');
const handLink = document.getElementById('video_hand_link');
//const 變數名稱 = document.getElementById('指定的id名稱')

//const：宣告一個不可重新賦值的變數

//document代表整個html結構

//document.getElementById()：用來從 HTML 文件中抓取具有特定 id 的元素


//------------------------------------------------------------------------------------------

//            當滑鼠移到不同元素時更改視頻

helmetLink.addEventListener('mouseover', () => {
  videoBackground.src = './images/my_helmet.mp4'; // 播放 my_helmet.mp4
  videoBackground.play(); //雖html裡有設定autoplay 但避免程式被更動或是瀏覽器不允許而被破壞 所以留下
});

suitLink.addEventListener('mouseover', () => {
  videoBackground.src = './images/my_suit.mp4'; // 播放 my_suit.mp4
  videoBackground.play(); //雖html裡有設定autoplay 但避免程式被更動或是瀏覽器不允許而被破壞 所以留下
});

handLink.addEventListener('mouseover', () => {
  videoBackground.src = './images/my_hand.mp4'; // 播放 my_hand.mp4
  videoBackground.play(); //雖html裡有設定autoplay 但避免程式被更動或是瀏覽器不允許而被破壞 所以留下
});
//元素.addEventListener('事件類型',事件處裡函數,布林值);可以接受兩到三個主要參數（布林值可省略）

//事件類型：監聽觸發在元素的事件 比如'click'（滑鼠點擊事件）'mouseover'（滑鼠移入事件）'keydown'（按鍵按下事件）

//事件處理類型：當事件被觸發時 這個函數才會被執行

//回呼函數可以是一個匿名函數 箭頭函數 或已經定義好的函數 待事件成立時會將此函數內容回傳給上一層函數 上方內容是使用箭頭函數

//箭頭函數運作過程： 按鈕.addEventListener('click',() => { 變色; }); 如左例子 一個()有'變色'的函數 當被滑鼠點擊時 變色會透過()回傳到addEventListener 這時按鈕就會接收到變色的內容


//------------------------------------------------------------------------------------------

//            可以根據需要，當滑鼠移開時停止播放或恢復原來的視頻

helmetLink.addEventListener('mouseleave', () => {
  videoBackground.src = './images/index_video.mp4'; // 恢復原來的視頻
  videoBackground.play();
});

suitLink.addEventListener('mouseleave', () => {
  videoBackground.src = './images/index_video.mp4'; // 恢復原來的視頻
  videoBackground.play();
});

handLink.addEventListener('mouseleave', () => {
  videoBackground.src = './images/index_video.mp4'; // 恢復原來的視頻
  videoBackground.play();
});
//同樣使用.addEventListener函數 只是事件變成滑鼠移出 影片改成原本影片
