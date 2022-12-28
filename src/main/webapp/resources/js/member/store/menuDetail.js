$("#plus_btn").click(function () {
    let newCount = parseInt($("#menu_count").val()) + 1;
    $("#menu_count").val(newCount);
    count = newCount;
    get_total_price();
});
$("#minus_btn").click(function () {
    if ($("#menu_count").val() > 1) {
        let newCount = parseInt($("#menu_count").val()) - 1;
        $("#menu_count").val(newCount);
        count = newCount;
    }
    get_total_price();
});

$(".option_check").on("click", function () {
    get_total_price();
});

// 총 가격을 뽑고 server에 넘길 데이터를 초기화함.
function get_total_price() {
    let totalPrice = parseInt($("#menu_price").html());

    let option_check = $(".option_check");
    select_option = new Array();
    option_check.each(function (index, item) {
        let optionSeq = parseInt($(item).closest(".option").find(".option_seq").val());
        if (item.checked == true) {
            totalPrice += parseInt($(item).closest(".option").find(".option_price").val());
            one_price = totalPrice;

            select_option.push(optionSeq);
        }
    });

    totalPrice *= parseInt($("#menu_count").val());
    console.log(select_option);
    $("#total_price").text(totalPrice);
}

//장바구니 담기
function putBasket() {
    var basket = new BasketMenuDTO(select_option, count, one_price);
    $("#basket_menu").val(JSON.stringify(basket));

    $("#put_basket").submit();
}

//장바구니 담고 결제하러 가기
function toPayment() {
    var basket = new BasketMenuDTO(select_option, count, one_price);
    $("#basket_menu").val(JSON.stringify(basket));

    $("#put_basket").attr("action", "/menu/detail/toPay").submit();
}

const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
        confirmButton: 'btn btn-success mx-2',
        cancelButton: 'btn btn-danger mx-2'
    },
    buttonsStyling: false
})
function onModal() {

    swalWithBootstrapButtons.fire({
        showCancelButton: true,
        confirmButtonText: '결제 하러 가기',
        cancelButtonText: '다른 메뉴 보기',
        reverseButtons: true,
        width: 380
    }).then((result) => {
        if (result.isConfirmed) {
            toPayment();
        } else{
            putBasket();
        }
    })
}


















