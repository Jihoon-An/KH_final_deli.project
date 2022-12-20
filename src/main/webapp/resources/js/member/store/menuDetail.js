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
    get_total_price(this);
});

// 총 가격을 뽑고 server에 넘길 데이터를 초기화함.
function get_total_price(elem) {
    let total_price = parseInt($("#menu_price").html());

    let option_check = $(elem);

    option_check.each(function (index, item) {
        let optionDtoToJson = $(item).closest(".option").find(".optionDTO").val();
        let optionDto = JSON.parse(optionDtoToJson);
        if (item.checked == true) {
            total_price += parseInt($(item).closest(".option").find(".option_price").val());
            one_price = total_price;

            // select_option.push($(item).closest(".option").find(".optionDTO").val());
            select_option.push(optionDto);
        } else {
            // let index = select_option.indexOf($(item).closest(".option").find(".optionDTO").val());
            let index = select_option.indexOf(optionDto);
            if (index > -1) {
                select_option.splice(index, 1);
            }
        }
        console.log(select_option);
    });

    total_price *= parseInt($("#menu_count").val());

    $("#total_price").text(total_price);
}

//장바구니 담기
function putBasket() {

    var basket = new BasketMenuDTO(select_option, count, one_price);
    $("#basket_menu").val(JSON.stringify(basket));
    // $("#basket_menu").val(basket);
    console.log($("#basket_menu").val());
    $("#put_basket").submit();
}





















