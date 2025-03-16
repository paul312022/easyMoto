//                    首頁快速導覽區塊的錨點連結
//------------------------------------------------------------------------------------------

//內容將在頁面加載完成後執行

//document代表整個html結構
//DOMContentLoaded成立後 才做function(){...}的內容
document.addEventListener('DOMContentLoaded', function () {


  //            取得各個按鈕元素

  const section1Btn = document.getElementById('section1-btn');
  const section2Btn = document.getElementById('section2-btn');
  const section3Btn = document.getElementById('section3-btn');

  //            取得各個區域的元素

  const section1 = document.getElementById('header');
  const section2 = document.getElementById('content');
  const section3 = document.getElementById('scontent');


  //const 變數名稱 = document.getElementById('指定的id名稱')

  //const：宣告一個不可重新賦值的變數

  //document.getElementById()：用來從 HTML 文件中抓取具有特定 id 的元素


//------------------------------------------------------------------------------------------

  //            設置滾動到相應區域的功能

  section1Btn.addEventListener('click', function () {
    section1.scrollIntoView({ behavior: 'smooth' }); //scrollIntoView:將目標元素滾動到視窗可見範圍內 此處設為平滑滾動 若省略 會變成瞬間跳到目標元素
  });

  section2Btn.addEventListener('click', function () {
    section2.scrollIntoView({ behavior: 'smooth' }); //scrollIntoView:將目標元素滾動到視窗可見範圍內 此處設為平滑滾動 若省略 會變成瞬間跳到目標元素
  });

  section3Btn.addEventListener('click', function () {
    section3.scrollIntoView({ behavior: 'smooth' }); //scrollIntoView:將目標元素滾動到視窗可見範圍內 此處設為平滑滾動 若省略 會變成瞬間跳到目標元素
  });
  //元素.addEventListener('事件類型',事件處裡函數,布林值);可以接受兩到三個主要參數（布林值可省略）

  //事件類型：監聽觸發在元素的事件 比如'click'（滑鼠點擊事件）'mouseover'（滑鼠移入事件）'keydown'（按鍵按下事件）

  //事件處理類型：當事件被觸發時 這個函數才會被執行

  //回呼函數可以是一個匿名函數 箭頭函數 或已經定義好的函數 待事件成立時會將此函數內容回傳給上一層函數 上方內容是使用匿名函數

  //匿名函數運作過程： 按鈕.addEventListener('click',function () { 變色; }); 如左例子 一個()有'變色'的函數 當被滑鼠點擊時 變色會透過function () 回傳到addEventListener 這時按鈕就會接收到變色的內容


  //            偵測滾動事件來變更按鈕狀態

  window.addEventListener('scroll', function () {
    const scrollPosition = window.scrollY;
    //當視窗滾動時 window.scrollY會將從頂部到此的距離(單位px)放在scrollPosition

    // 判斷當前滾動區域，並調整按鈕的選中狀態

    if (scrollPosition >= section3.offsetTop - 200) { //如果現在達到section3-200px的高度
      setActiveButton(section3Btn); //setActiveButton存成section3Btn
    } else if (scrollPosition >= section2.offsetTop - 200) { //如果現在達到section2-200px的高度
      setActiveButton(section2Btn); //setActiveButton存成section2Btn
    } else { //剩下的就是section1的高度區域
      setActiveButton(section1Btn); //setActiveButton存成section1Btn
    }
  });

  //            設置激活狀態的按鈕

  function setActiveButton(activeBtn) {
    const buttons = [section1Btn, section2Btn, section3Btn]; //定義了一個名為 buttons 的陣列
    buttons.forEach(btn => { //forEach() 是針對陣列的一個操作方法 使用btn可以用來遍歷陣列中的每個元素
      if (btn === activeBtn) { //查看section1Btn section2Btn section3Btn誰是activeBtn 添加active
        btn.classList.add('active');
      } else { //如果不是activeBtn 刪除active
        btn.classList.remove('active');
      }
    });
  }


  //            自動設置 section1-btn 為激活狀態

  setActiveButton(section1Btn);
});
