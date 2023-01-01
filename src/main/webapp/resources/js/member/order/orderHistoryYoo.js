
//리뷰 작성버튼 누르면 체크
$(".reviewChk").on("click", function (){

    let orderSeq = $(this).closest(".box3").find(".order_Seq_Chk").val();
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



 $(".reOrder").on("click", function (){
     var countt= $(this).closest(".box3").find(".m_count").val()
     var selec_option = new Array();
     var one_pprice = $(this).closest(".box3").find(".m_price").val()

    console.log(one_pprice);
     console.log(countt);
     console.log(selec_option);
     class BasketMenuDTOo{
         constructor(options, count, price) {
             this.storeSeq = $(this).closest(".box3").find(".m_store_seq").val()
             this.menuSeq = $(this).closest(".box3").find(".m_menu_seq").val()
             this.optionSeqList = options;
             this.count = count;
             this.price = price;
         }
     }
     console.log("가게seq"+ $(this).closest(".box3").find(".m_store_seq").val())
     var basket = new BasketMenuDTOo(selec_option, countt, one_pprice); //객체가
     $("#basket_menu").val(JSON.stringify(basket));

   $("#put_basket").attr("action", "/menu/detail/toBasket").submit();
 })





//     function putBaskett() {
//     var basket = new BasketMenuDTOo(selec_option, countt, one_pprice);
//     $("#basket_menu").val(JSON.stringify(basket));
//
//     $("#put_basket").submit();
// }

//     function toBaskett() {
//
//     var basket = new BasketMenuDTOo(selec_option, countt, one_pprice); //객체가
//     $("#basket_menu").val(JSON.stringify(basket));
//
//    $("#put_basket").attr("action", "/menu/detail/toBasket").submit();
// }
