$(function(){
    // 滑鼠滑過小圖時 顯示在主圖中
    $(".smail_img_to_big_img a").mouseover(function(){
        var imgsrc=$(this).children("img").attr("src");
        $("#showGoods").attr({"src":imgsrc});
    });
    // 將小圖放到lightbox展示
    $(".fancybox").fancybox();
});