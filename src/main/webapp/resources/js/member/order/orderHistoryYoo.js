
//리뷰 작성버튼 누르면 체크
$(".reviewChk").on("click", function (){

    let orderSeq = $(this).closest(".box3").find(".orderSeqChk").val();
    console.log(orderSeq)

        $.ajax({
            url:"/order/history/reviewChk",
            type:"post",
            data:{order_seq:orderSeq}
        }).done(function (result){
            console.log("결과값 결과"+result)
             if(result){ // true면 리뷰 작성 가능
                console.log("리뷰작성가능")
                 location.href="/myPage/reviewWrite/"+orderSeq;
             }else{
                 console.log("리뷰작성불가능")
                 Swal.fire({title: "지정 필수", icon: "error", text: "이미 리뷰를 등록하였습니다"});

             }

   })


})