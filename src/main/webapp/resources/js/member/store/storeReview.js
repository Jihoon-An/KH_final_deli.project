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