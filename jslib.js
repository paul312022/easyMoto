//加入後台購物車
function addcart(p_id){
    var qty=$("#qty").val();
    // 下面多新增
    var p_size=$("#size").val();
    // 上面多新增
    if(qty <= 0){
        alert("數量不得為0或負數");
        return(false);
    }
    if(qty == undefined){
        qty=1;
    }
    else if(qty >=3){
        alert("數量限制在50以下");
        return(false);
    }
    // 利用jquery $.ajax呼叫後台的addcart.php
    $.ajax({
        url:'addcart.php',
        type:'get',
        dataType:'json',
        data:{ p_id: p_id, qty: qty, p_size: p_size },
        success:function(data){
            if (data.c == true){
                alert(data.m);
                window.location.reload();
            }
            else{
                alert(data.m);
            }
        },
        error:function(data){
            alert("無法連到後台");
        }
    });
}

// 跳出確認訊息對話框
function btn_confirmLink(message, url) {
    if (message == "" || url == "") {
        return false;
    }
    if (confirm(message)) {
        window.location = url;
    }
    return false;
}