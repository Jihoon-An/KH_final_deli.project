$(document).ready(function (){


$(".heart").on("click",function (){

    let storeSeq=$(this).children().val();
    let heartIcon=$(this).find(".heartIcon");
    console.log("식당시퀀스 : "+storeSeq);

    $.ajax({
        url:"/myPage/dibs/like",
        type: "post",
        data: {
            store_seq:storeSeq
        }
    }).done(function(resp){

        if(resp==0){
            heartIcon.css('text-shadow','0 0 0 rgba(217, 216, 214, 0.99)');
        }else {
            heartIcon.css('text-shadow','0 0 0 rgba(232,76,79)');
        }
    })
});

});