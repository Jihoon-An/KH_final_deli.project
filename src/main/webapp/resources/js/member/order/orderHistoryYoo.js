
//리뷰 작성버튼 누르면 체크
$(".reviewChk").on("click", function (){

    let orderSeq = $(this).closest(".box3").find(".order_Seq_Chk").val();

    $.ajax({
        url:"/order/history/reviewChk",
        type:"post",
        data:{order_seq:orderSeq}
    }).done(function (result){
        if(result){ // true면 리뷰 작성 가능
            location.href="/myPage/reviewWrite/"+orderSeq;
        }else{
            Swal.fire({title: "지정 필수", icon: "error", text: "이미 리뷰를 등록하였습니다"});
        }

    })


})



 $(".reOrder").on("click", function (){
     var countt= $(this).closest(".box3").find(".m_count").val()
     var selec_option = new Array();
     var one_pprice = $(this).closest(".box3").find(".m_price").val()

     class BasketMenuDTOo{
         constructor(options, count, price) {
             this.storeSeq = $(this).closest(".box3").find(".m_store_seq").val()
             this.menuSeq = $(this).closest(".box3").find(".m_menu_seq").val()
             this.optionSeqList = options;
             this.count = count;
             this.price = price;
         }
     }
     var basket = new BasketMenuDTOo(selec_option, countt, one_pprice); //객체가
     $("#basket_menu").val(JSON.stringify(basket));

   $("#put_basket").attr("action", "/menu/detail/toBasket").submit();
 })