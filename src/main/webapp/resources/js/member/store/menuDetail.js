$("#plus_btn").click(function () {
    let new_count = parseInt($("#menu_count").val()) + 1;
    $("#menu_count").val(new_count);
    count = new_count;
    get_total_price();
});
$("#minus_btn").click(function () {
    if ($("#menu_count").val() > 1) {
        let new_count = parseInt($("#menu_count").val()) - 1;
        $("#menu_count").val(new_count);
        count = new_count;
    }
    get_total_price();
});

$(".option_check").on("click", function () {
    get_total_price();
});

// 총 가격을 뽑고 server에 넘길 데이터를 초기화함.
function get_total_price() {
    let total_price = parseInt($("#menu_price").html());

    let option_check = $(".option_check");
    select_option = new Array();
    option_check.each(function (index, item) {
        let option_seq = parseInt($(item).closest(".option").find(".option_seq").val());
        if (item.checked == true) {
            total_price += parseInt($(item).closest(".option").find(".option_price").val());
            one_price = total_price;

            select_option.push(option_seq);
        }
    });

    total_price *= parseInt($("#menu_count").val());
    console.log(select_option);
    $("#total_price").text(total_price);
}

//장바구니 담기
function putBasket() {

    var basket = new BasketMenuDTO(select_option, count, one_price);
    $("#basket_menu").val(JSON.stringify(basket));

    $("#put_basket").submit();
}





















