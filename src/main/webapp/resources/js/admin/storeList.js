
let lang_kor = {
    "decimal" : "",
    "emptyTable" : "데이터가 없습니다.",
    "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
    "infoEmpty" : "0 개",
    "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "_MENU_ 개씩 보기",
    "loadingRecords" : "로딩중...",
    "processing" : "처리중...",
    "search" : "검색 : ",
    "zeroRecords" : "검색된 데이터가 없습니다.",
    "paginate" : {
        "first" : "첫 페이지",
        "last" : "마지막 페이지",
        "next" : "다음",
        "previous" : "이전"
    },
    "aria" : {
        "sortAscending" : " :  오름차순 정렬",
        "sortDescending" : " :  내림차순 정렬"
    }
};

$(document).ready(function() {
    $('#myTable').DataTable( {
        language : lang_kor,
        order: [[0, 'desc']],lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, 'All'],
        ]
    } );
} );



$("#myTable_paginate").on("click",function () {
    trClickEvent();
});

//모달
$(".store").on("click",function (){

    let store_seq=$(this).find(".store_seq").text();
    let store_name=$(this).find(".store_name").text();
    let store_category=$(this).find(".store_category").text();
    let store_phone=$(this).find(".store_phone").text();
    let store_add_detail1=$(this).find(".store_add_detail1").text();
    let owner_num=$(this).find(".owner_num").text();
    let owner_name=$(this).find(".owner_name").text();
    let store_display=$(this).find(".store_display").text();

    $(".modal").find("#store_seq").val(store_seq);
    $(".modal").find("#store_name").val(store_name);
    $(".modal").find("#store_category").val(store_category);
    $(".modal").find("#store_phone").val(store_phone);
    $(".modal").find("#store_add_detail1").val(store_add_detail1);
    $(".modal").find("#owner_num").val(owner_num);
    $(".modal").find("#owner_name").val(owner_name);
    $(".modal").find("#store_display").val(store_display);

    if($("#store_display").val() == 'Y'){
        $("#statusBtn").text("비공개");
    }else {
        $("#statusBtn").text("공개");
    }

    $(".modal").fadeIn();
})

//모달끄기
$(".closeBtn").on("click",function () {
    $(".modal").fadeOut();
});






//삭제
$("#deleteBtn").on("click",function (){
    Swal.fire({
        title: $("#store_name").val()+'을(를) 삭제하시겠습니까?',
        text: "복구할 수 없습니다.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                '식당 삭제!',
                $("#store_name").val()+'을(를) 삭제하였습니다.',
                '삭제 성공'
            )
            let store_seq=$("#store_seq").val();

            if(result){
                $(".modal").fadeOut();
                $.ajax({
                    url:"/admin/store/list/deleteStore",
                    data: {
                        "store_seq":store_seq
                    },
                    type: "post"
                }).done(function (){
                    location.reload();
                })
            }
        }
    })
})

//비공개 공개 기능
$("#statusBtn").on("click",function (){
   let status = $("#store_display").val();
    let store_seq=$("#store_seq").val();

    if(status == 'Y'){
        $(".modal").fadeOut();
        $.ajax({
            url:"/admin/store/list/updateDisplayAsN",
            data: {
                "store_seq":store_seq
            },
            type: "post"
        }).done(function (){
            location.reload();
        })
    }else{
        $(".modal").fadeOut();
        $.ajax({
            url:"/admin/store/list/updateDisplayAsY",
            data: {
                "store_seq":store_seq
            },
            type: "post"
        }).done(function (){
            location.reload();
        })
    }
})