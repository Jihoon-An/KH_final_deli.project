/**
 * 가게 정보
 */
const storeSeq = $("#storeSeq").val();
const deliTip = parseInt($("#deliTipSpan").html().replace(/,/g,""));

/**
 * Script BasketMenuDTO
 */
class BasketMenuDTO {
    constructor(inputMenuSeq, optionSeqList, count, price) {
        this.storeSeq = storeSeq;
        this.menuSeq = inputMenuSeq;
        this.optionSeqList = optionSeqList;
        this.count = count;
        this.price = price/count;
    }
}

/**
 * 장바구니 업데이트 function
 */
async function updateBasket() {

    let basketMenuDTOList = [];

    // menuBox Div 갯수
    let menuBoxCount = $(".container").children(".menuBox").length;

    for (let i = 0; menuBoxCount > i; i++) {
        let inputMenuSeq = $(".menuBox").eq(i).find(".inputMenuSeq").val();

        let inputOptionSeqCount =
            $(".menuBox").eq(i).find(".menuInfo").children(".inputOptionSeq").length;
        let optionSeqList = [];
        for (let k = 0; inputOptionSeqCount > k; k++) {
            optionSeqList.push($(".menuBox").eq(i).find(".inputOptionSeq").eq(k).val());
        }
        let count = $(".menuBox").eq(i).find(".countSpan").html();
        let price = $(".menuBox").eq(i).find(".priceSpan").html().replace(/,/g,"");

        let basketMenuDTO = new BasketMenuDTO(inputMenuSeq, optionSeqList, count, price);
        basketMenuDTOList.push(basketMenuDTO);
    }


    await $.ajax({
        url: "/basket/updateMenu",
        type: "post",
        data: {basketMenuList: JSON.stringify(basketMenuDTOList)}
    }).done(function (result) {});

}


/**
 * 수량 - 버튼 기능
 */
$(".minus").click(async function() {
    let count = parseInt($(this).closest(".countBox").find(".countSpan").html());

    if (count > 1) {
        count--
        $(this).closest(".countBox").find(".countSpan").text(count);

        // 총 수량 --
        let countPB = parseInt($("#countPB").html());
        $("#countPB").text(--countPB);
        // 메뉴 가격
        let menuPrice = parseInt(
            $(this).closest(".menuBox").find(".menuPrice").html().replace(/,/g,"")
        );
        // 첫 번째 옵션 가격의 형제들
        let optionCount = $(this).closest(".menuBox").find(".menuInfo").children(".optionInfo");
        // 메뉴 + 옵션 가격들
        for (let i = 1; optionCount.length >= i; i++){
            menuPrice += parseInt(
                $(this).closest(".menuBox").find(".op"+i).html().replace(/,/g,"")
            )
        }

        // 메뉴 금액
        $(this).closest(".menuBox").find(".priceSpan").text(
            (menuPrice * count).toLocaleString()
        );

        // 총 주문금액
        let totalPrice = parseInt($("#totalPriceSpan").html().replace(/,/g,""));
        $("#totalPriceSpan").text((totalPrice - menuPrice).toLocaleString());

        // 결제예정금액
        let payAmount = parseInt($("#payAmountSpan").html().replace(/,/g,""));
        $("#payAmountSpan").text((totalPrice - menuPrice + deliTip).toLocaleString());
        $("#totalPB").text($("#payAmountSpan").html());


        // 장바구니 업데이트
        await updateBasket();
    }
});



/**
 * 수량 + 버튼 기능
 */
$(".plus").click(async function() {
    let count = parseInt($(this).closest(".countBox").find(".countSpan").html());

    if (count < 99) {
        count++
        $(this).closest(".countBox").find(".countSpan").text(count);

        //총 수량 ++
        let countPB = parseInt($("#countPB").html());
        $("#countPB").text(++countPB);
        // 메뉴 가격
        let menuPrice = parseInt(
            $(this).closest(".menuBox").find(".menuPrice").html().replace(/,/g,"")
        );
        // 첫 번째 옵션 가격의 형제들
        let optionCount = $(this).closest(".menuBox").find(".menuInfo").children(".optionInfo");
        // 메뉴 + 옵션 가격들
        for (let i = 1; optionCount.length >= i; i++) {
            menuPrice += parseInt(
                $(this).closest(".menuBox").find(".op" + i).html().replace(/,/g,"")
            )
        }

        // 메뉴 금액
        $(this).closest(".menuBox").find(".priceSpan").text(
            (menuPrice * count).toLocaleString()
        );

        // 총 주문금액
        let totalPrice = parseInt($("#totalPriceSpan").html().replace(/,/g,""));
        $("#totalPriceSpan").text((totalPrice + menuPrice).toLocaleString());

        // 결제예정금액
        let payAmount = parseInt($("#payAmountSpan").html().replace(/,/g,""));
        $("#payAmountSpan").text((totalPrice + menuPrice + deliTip).toLocaleString());
        $("#totalPB").text($("#payAmountSpan").html());


        // 장바구니 업데이트
        await updateBasket();
    }
});



/**
 * 삭제 버튼 기능
 */
$(".deleteBtn").click(async function(){
    let count = parseInt($(this).closest(".menuBox").find(".countSpan").html());

    // 총 수량 --
    let countPB = parseInt($("#countPB").html());
    $("#countPB").text((countPB - count));

    // 메뉴 금액
    let price = parseInt(
        $(this).closest(".menuBox").find(".menuPrice").html().replace(/,/g,"")
    );

    // 총 주문금액
    let totalPrice = parseInt($("#totalPriceSpan").html().replace(/,/g,""));
    let minusTotalPrice = totalPrice - price;

    // 결제예정금액
    let payAmount = parseInt($("#payAmountSpan").html().replace(/,/g,""));
    let minusPayAmount = minusTotalPrice + deliTip;

    $("#totalPriceSpan").text(minusTotalPrice.toLocaleString());
    $("#payAmountSpan").text(minusPayAmount.toLocaleString());
    $("#totalPB").text($("#payAmountSpan").html());

    // 삭제
    $(this).closest(".menuBox").remove();


    // 장바구니 업데이트
    await updateBasket();

    if ($("#container").children(".menuBox").length < 1) {
        location.reload();
    }
});


/**
 * 장바구니 비우기 버튼 기능
 */
$("#emptyBasketButton").click(async ()=>{
    $(".container").children(".menuBox").remove();
    await updateBasket();
    location.reload();
})



/**
 * 결제 버튼 기능
 */
$("#pay").click(function() {
    if (parseInt($("#totalPriceSpan").html().replace(/,/g,"")) >= $("#minPrice").val()) {
        $("#payAmount").val(parseInt($("#payAmountSpan").html().replace(/,/g,"")));
    } else{
        Swal.fire({
            icon: 'error',
            title: '주문금액 부족',
            text: ($("#minPriceText").val())+ '원 이상부터 주문할 수 있어요',
        });
        return false;
    }
});



