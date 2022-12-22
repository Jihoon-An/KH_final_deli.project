$(document).ready(function () {
    $('#myTable').DataTable();
});

$("#myTable_paginate").on("click",function () {
    trClickEvent();
});

$(".store").on("click",function (){

    let store_seq=$(this).find(".store_seq").text();
    let store_name=$(this).find(".store_name").text();
    let store_category=$(this).find(".store_category").text();
    let store_phone=$(this).find(".store_phone").text();
    let store_add_detail1=$(this).find(".store_add_detail1").text();
    let owner_num=$(this).find(".owner_num").text();
    let owner_name=$(this).find(".owner_name").text();

    $(".modal").find("#store_seq").val(store_seq);
    $(".modal").find("#store_name").val(store_name);
    $(".modal").find("#store_category").val(store_category);
    $(".modal").find("#store_phone").val(store_phone);
    $(".modal").find("#store_add_detail1").val(store_add_detail1);
    $(".modal").find("#owner_num").val(owner_num);
    $(".modal").find("#owner_name").val(owner_name);

    $(".modal").fadeIn();
})

$(".closeBtn").on("click",function () {
    $(".modal").fadeOut();
});

$("#deleteBtn").on("click",function (){
    let result= confirm($("#store_name").val()+"을(를) 삭제하시겠습니까?");
    let store_seq=$("#store_seq").val();
    console.log(store_seq);
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

})