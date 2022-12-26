$(".heart").on("click",function (){

    let store_seq=$(this).children().val();
    console.log("식당시퀀스 : "+store_seq);

    $.ajax({
        url:"/myPage/dibs/like",
        type: "post",
        data: {
            store_seq:store_seq
        }
    }).done(function (){

    })
});

// $("#to_info").on("click",function(){
//     $.ajax({
//         url:"/store/info",
//         data: "storeInfo.jsp",
//         datatype: "html",
//         type: "post"
//     }).done(function(resp){
//         $(".contents").html(resp);
//     })
// })