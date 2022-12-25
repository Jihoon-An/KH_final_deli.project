$(document).ready(function (){


$(".heart").on("click",function (){

    // let like_val=$(this).children().val();
    // console.log("찜 시퀀스 : "+like_val);
    // let store_seq=$(this).parent().prev().val();
    let store_seq=$(this).children().val();
    console.log("식당시퀀스 : "+store_seq);

    $.ajax({
        url:"/myPage/dibs/like",
        type: "post",
        data: {
            // like_val:like_val,
            store_seq:store_seq
        }
    }).done(function (){

    })
});

});