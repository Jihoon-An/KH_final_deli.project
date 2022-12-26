$('#myTable').DataTable();

trClickEvent();
//페이지 버튼을 눌렀을때 다시 script 돌아가게
$("#myTable_paginate").click(function () {
    trClickEvent();
});

function trClickEvent() {
    $("tr").click(function () {

        $("#frm").find(".writer").val(
            $(this).find(".mem_name").html()
        );

    })
};

//모달닫기
$(".closeModal").click(function () {
    $(".modal").fadeOut();
});

