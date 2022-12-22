/**
 * 가게 정보
 */
const storeSeq = $("#storeSeq").val();
const deliTip = parseInt($("#deliTipSpan").html());

/**
 * Script BasketMenuDTO
 */
class BasketMenuDTO {
    constructor(inputMenuSeq, optionSeqList, count, price) {
        this.storeSeq = storeSeq;
        this.menuSeq = inputMenuSeq;
        this.optionSeqList = optionSeqList;
        this.count = count;
        this.price = price;
    }
}

/**
 * 장바구니 업데이트 function
 */
function updateBasket() {

    let basketMenuDTOList = [];

    // menuBox Div 갯수
    let menuBoxCount = $(".menuBox").siblings(".menuBox").length;

    for (let i = 0; menuBoxCount > i; i++) {
        let inputMenuSeq = $(".menuBox").eq(i).find(".inputMenuSeq").val();
        console.log(i +" 번 : " + inputMenuSeq);

        let inputOptionSeqCount = $(".menuBox").eq(i).children(".inputOptionSeq").length;
        console.log(i + " 번째 렝스 :  " + inputOptionSeqCount);
        let optionSeqList = [];
        for (let k = 0; inputOptionSeqCount > k; k++) {
            optionSeqList.push($(".menuBox").eq(i).find(".inputOptionSeq").eq(k).val());
            console.log(i +" "+k+" 번 : " + $(".menuBox").eq(i).find(".inputOptionSeq").eq(k).val());
        }
        let count = $(".menuBox").eq(i).find(".countSpan").html();
        let price = $(".menuBox").eq(i).find(".priceSpan").html();
        console.log(i +" 번 : " + count);
        console.log(i +" 번 : " + price);

        let basketMenuDTO = new BasketMenuDTO(inputMenuSeq, optionSeqList, count, price);

        basketMenuDTOList.push(basketMenuDTO);
    }

    $.ajax({
        url: "/basket/updateMenu",
        type: "post",
        data: {basketMenuList: JSON.stringify(basketMenuDTOList)}
    }).done(function (result) {});

}



/**
 * 수량 - 버튼 기능
 */
$(".minus").click(function() {
    let count = parseInt($(this).closest(".countBox").find(".countSpan").html());

    if (count > 1) {
        count--
        $(this).closest(".countBox").find(".countSpan").text(count);

        // 총 수량 --
        let countPB = parseInt($("#countPB").html());
        $("#countPB").text(--countPB);
        // 메뉴 가격
        let menuPrice = parseInt($(this).closest(".menuBox").find(".menuPrice").html());
        // 첫 번째 옵션 가격의 형제들
        let optionCount = $(this).closest(".menuBox").find(".optionPrice").siblings(".optionPrice");
        // 메뉴 + 옵션 가격들
        for (let i = 1; optionCount.length >= i; i++){
            menuPrice += parseInt($(this).closest(".menuBox").find(".op"+i).html())
        }

        // 메뉴 금액
        $(this).closest(".menuBox").find(".priceSpan").text(menuPrice * count);

        // 총 주문금액
        let totalPrice = parseInt($("#totalPriceSpan").html());
        $("#totalPriceSpan").text(totalPrice - menuPrice);

        // 결제예정금액
        let payAmount = parseInt($("#payAmountSpan").html());
        $("#payAmountSpan").text(totalPrice - menuPrice + deliTip);
        $("#totalPB").text($("#payAmountSpan").html());


        // 장바구니 업데이트
        updateBasket();
    }
});



/**
 * 수량 + 버튼 기능
 */
$(".plus").click(function() {
    let count = parseInt($(this).closest(".countBox").find(".countSpan").html());

    if (count < 99) {
        count++
        $(this).closest(".countBox").find(".countSpan").text(count);

        //총 수량 ++
        let countPB = parseInt($("#countPB").html());
        $("#countPB").text(++countPB);
        // 메뉴 가격
        let menuPrice = parseInt($(this).closest(".menuBox").find(".menuPrice").html());
        // 첫 번째 옵션 가격의 형제들
        let optionCount = $(this).closest(".menuBox").find(".optionPrice").siblings(".optionPrice");
        // 메뉴 + 옵션 가격들
        for (let i = 1; optionCount.length >= i; i++) {
            menuPrice += parseInt($(this).closest(".menuBox").find(".op" + i).html())
        }

        // 메뉴 금액
        $(this).closest(".menuBox").find(".priceSpan").text(menuPrice * count);

        // 총 주문금액
        let totalPrice = parseInt($("#totalPriceSpan").html());
        $("#totalPriceSpan").text((totalPrice + menuPrice));

        // 결제예정금액
        let payAmount = parseInt($("#payAmountSpan").html());
        $("#payAmountSpan").text(totalPrice + menuPrice + deliTip);
        $("#totalPB").text($("#payAmountSpan").html());


        // 장바구니 업데이트
        updateBasket();
    }
});



/**
 * 삭제 버튼 기능
 */
$(".deleteBtn").click(function(){
    let count = parseInt($(this).closest(".menuBox").find(".countSpan").html());

    // 총 수량 --
    let countPB = parseInt($("#countPB").html());
    $("#countPB").text((countPB - count));

    // 메뉴 금액
    let price = parseInt($(this).closest(".menuBox").find(".priceSpan").html());

    // 총 주문금액
    let totalPrice = parseInt($("#totalPriceSpan").html());
    $("#totalPriceSpan").text(totalPrice - price);

    // 결제예정금액
    let payAmount = parseInt($("#payAmountSpan").html());
    $("#payAmountSpan").text(totalPrice - price + deliTip);
    $("#totalPB").text($("#payAmountSpan").html());

    // 삭제
    $(this).closest(".menuBox").remove();


    // 장바구니 업데이트
    updateBasket();
});



/**
 * 결제 버튼 기능
 */
$("#pay").click(function() {
    $("#payAmount").val(parseInt($("#payAmountSpan").html()));
});



