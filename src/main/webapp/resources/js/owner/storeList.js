$(document).ready(function () {
    $('#myTable').DataTable();
});

$(".del_btn").click(function () {
    let del_form = $(this).closest("form");

    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            $(del_form).submit();
        }
    })
});

$(".display_toggle").click(function () {
    let storeSeq =$(this).closest(".store").find(".store_seq").val();
    let orgVal = $(this).siblings(".display_val").text();
    let newVal;
    if (orgVal == 'Y') {
        newVal = 'N';
    } else {
        newVal = 'Y';
    }
    $(this).siblings(".display_val").text(newVal);

    $.ajax({
        url: "/owner/store/list/displayToggle",
        method: "post",
        data: {storeSeq: storeSeq, newVal: newVal}
    })
});

// $(".del_btn").on("click",function(){
//     let store_seq=$(this).closest(".btn").find(".store_seq").val();
//     $.ajax({
//         url:"/owner/store/list/delete",
//         data:{
//             "store_seq":store_seq
//         },
//         method:"post"
//     }).done(function(resp){
//         location.reload();
//         console.log("식당삭제완");
//     })
// })
