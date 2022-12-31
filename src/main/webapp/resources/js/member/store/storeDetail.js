$(".heart").on("click",function (){

    let store_seq=$(this).children().val();
    let heartIcon=$(this).find(".heartIcon");
    console.log("식당시퀀스 : "+store_seq);

    $.ajax({
        url:"/myPage/dibs/like",
        type: "post",
        data: {
            store_seq:store_seq
        }
    }).done(function (resp){
        if(resp==1){
            heartIcon.css('text-shadow','0 0 0 rgba(232,76,79)');
        }else {
            heartIcon.css('text-shadow','0 0 0 rgba(217, 216, 214, 0.99)');
        }
    })
});



var x,left,down;

$(".filter_box").mousedown(function(e){
    e.preventDefault();
    down = true;
    x = e.pageX;
    left = $(this).scrollLeft();
});

$("body").mousemove(function(e){
    if(down){
        var newX = e.pageX;
        $(".filter_box").scrollLeft(left - newX + x);
    }
});

$("body").mouseup(function(e){down = false;});
