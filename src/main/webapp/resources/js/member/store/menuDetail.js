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
    $("#total_price").text(totalPrice);
}

//장바구니 담기
function putBasket() {
    var basket = new BasketMenuDTO(select_option, count, one_price);

    if (checkStoreSeq(basket.storeSeq)) {
        return;
    }

    $("#basket_menu").val(JSON.stringify(basket));

    $("#put_basket").attr("action", "/menu/detail/put").submit();
}

function toBasket() {
    var basket = new BasketMenuDTO(select_option, count, one_price);

    if (checkStoreSeq(basket.storeSeq)) {
        return;
    }
    $("#basket_menu").val(JSON.stringify(basket));

    $("#put_basket").attr("action", "/menu/detail/toBasket").submit();
}

function checkStoreSeq(thisStoreSeq) {

    if (basketStoreSeq != "" && thisStoreSeq != Number(basketStoreSeq)) {
        Swal.fire({
            text: '다른 식당의 메뉴를 장바구니에 저장할 수 없습니다.',
            width: 300
        });

        return true;
    }
    return false;
}

const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
        confirmButton: 'btn btn-success mx-2',
        cancelButton: 'btn btn-danger mx-2'
    },
    buttonsStyling: false
})

function onModal() {
    let requiredCheck = true;
    $(".option_select").each(function () {
        let required = $(this).find(".required").val();
        console.log(required);
        if (required == 'N') {
            return false;
        }
        let test = $(this).find('.option_check').is(":checked");
        if (test == false) {
            requiredCheck = test;
        }
    });

    if (requiredCheck == false) {
        Swal.fire({
            title: "필수 항목을\n체크해주세요!",
            width: 350
        });
    }


    return false;
    swalWithBootstrapButtons.fire({
        showCancelButton: true,
        confirmButtonText: '장바구니 가기',
        cancelButtonText: '다른 메뉴 보기',
        reverseButtons: true,
        width: 380
    }).then((result) => {
        if (result.isConfirmed) {
            toBasket();
        } else {
            putBasket();
        }
    })
}

$(function () {
    $(".option_select").each(function () {
        let required = $(this).find(".required").val();
        if (required=="Y") {
            $(this).prev(".option_group").append(" (필수)")
        }
    });
});
















