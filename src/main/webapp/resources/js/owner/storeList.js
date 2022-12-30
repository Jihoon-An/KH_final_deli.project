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

$(".name").click(function () {
    $("#frm").attr("action", "/owner/store/mng").submit();
});
