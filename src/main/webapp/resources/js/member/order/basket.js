
// 수량 - 버튼
$(".minus").click(function() {
    let count = $(this).closest(".countBox").find(".countSpan").html();
    count--
    $(this).closest(".countBox").find(".countSpan").text(count);

    let menuPrice = parseInt($(this).closest(".menuBox").find(".menuPrice").html());
    let optionCount = $(this).closest(".menuBox").find(".optionPrice").siblings(".optionPrice");

    for (let i = 1; optionCount.length >= i; i++){
        menuPrice += parseInt($(this).closest(".menuBox").find(".op"+i).html())
    }

    $(this).closest(".menuBox").find(".priceSpan").text(menuPrice * count);

    let totalPrice = parseInt($("#totalPrice").html());
    $("#totalPrice").text(totalPrice - menuPrice);
});

// 수량 + 버튼
$(".plus").click(function() {
    let count = $(this).closest(".countBox").find(".countSpan").html();
    count++
    $(this).closest(".countBox").find(".countSpan").text(count);

    let menuPrice = parseInt($(this).closest(".menuBox").find(".menuPrice").html());
    let optionCount = $(this).closest(".menuBox").find(".optionPrice").siblings(".optionPrice");

    for (let i = 1; optionCount.length >= i; i++){
        menuPrice += parseInt($(this).closest(".menuBox").find(".op"+i).html())
    }

    $(this).closest(".menuBox").find(".priceSpan").text(menuPrice * count);

    let totalPrice = parseInt($("#totalPrice").html());
    $("#totalPrice").text((totalPrice + menuPrice));
});
