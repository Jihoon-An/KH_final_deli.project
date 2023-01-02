$(document).ready(function () {
    $('#order_table').DataTable(
        {
            language: lang_kor, //or lang_eng
            ordering: false
        }
    );
});

// DataTables Default
var lang_eng = {
    "decimal": "",
    "emptyTable": "No data available in table",
    "info": "Showing _START_ to _END_ of _TOTAL_ entries",
    "infoEmpty": "Showing 0 to 0 of 0 entries",
    "infoFiltered": "(filtered from _MAX_ total entries)",
    "infoPostFix": "",
    "thousands": ",",
    "lengthMenu": "Show _MENU_ entries",
    "loadingRecords": "Loading...",
    "processing": "Processing...",
    "search": "Search : ",
    "zeroRecords": "No matching records found",
    "paginate": {
        "first": "First",
        "last": "Last",
        "next": "Next",
        "previous": "Previous"
    },
    "aria": {
        "sortAscending": " :  activate to sort column ascending",
        "sortDescending": " :  activate to sort column descending"
    }
};

// Korean
var lang_kor = {
    "decimal": "",
    "emptyTable": "데이터가 없습니다.",
    "info": "_START_ - _END_ (총 _TOTAL_ 명)",
    "infoEmpty": "0명",
    "infoFiltered": "(전체 _MAX_ 명 중 검색결과)",
    "infoPostFix": "",
    "thousands": ",",
    "lengthMenu": "_MENU_ 개씩 보기",
    "loadingRecords": "로딩중...",
    "processing": "처리중...",
    "search": "검색 : ",
    "zeroRecords": "검색된 데이터가 없습니다.",
    "paginate": {
        "first": "첫 페이지",
        "last": "마지막 페이지",
        "next": "다음",
        "previous": "이전"
    },
    "aria": {
        "sortAscending": " :  오름차순 정렬",
        "sortDescending": " :  내림차순 정렬"
    }
};

/**
 *상태 바꾸기 버튼 이벤트
 */
$("#status_btn").click(() => {
    let newStatus = $("#new_status").val();
    let checkBox = $("tbody .check_box");
    let checkedSeqList = new Array();

    for (let i = 0; i < checkBox.length; i++) {
        let checked = $(checkBox[i]).find('input').is(':checked');

        // 태그내용 변경, 변경 seq 저장
        if (checked){
            $(checkBox[i]).closest("tr").find(".status").html(newStatus);
            $(checkBox[i]).find('input').val(false);

            checkedSeqList.push(parseInt($(checkBox[i]).closest("tr").find(".order_seq").val()));
        }
    }

    //DB변경 요청
    $.ajax({
        url: "/owner/order/updateStatus",
        type: "post",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({
            checkedSeqListJson: JSON.stringify(checkedSeqList),
            newStatus: newStatus
        })
    });
});

/**
 * 전체 선택
 */
$('#all_check').click(function () {
    if ($('#all_check').is(':checked')) {
        $('tbody .check_box_input').prop('checked', true);
    } else {
        $('tbody .check_box_input').prop('checked', false);
    }
});
$('.check_box_input').click(function () {
    $('#all_check').prop('checked', false);
});

/**
 * 링크 보내기 버튼 이벤트
 */
$(".send_link_btn").click(function () {
    let deliLink = $(this).closest("tr").find(".deli_link").val();
    let tel;
    // 전화번호 입력
    Swal.fire({
        title: '전화번호를 입력하세요',
        text: '"-"는 빼고 입력하세요',
        input: 'tel',
        inputAttributes: {
            autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: '링크 보내기',
        showLoaderOnConfirm: true,
        preConfirm: (inputTel) => { //유효성 검사
            console.log(inputTel)
            if (/^010[0-9]{8}/.test(inputTel)) {
                tel = inputTel;
                return true;
            }
            else {
                Swal.showValidationMessage(
                    `유효하지 않은 전화번호 입니다.`
                )
            }
            return false;
        },
        allowOutsideClick: () => !Swal.isLoading()
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url:"/util/sendSms",
                type: "post",
                data: {tel:tel, msg:'딜리 라이더 링크\n'+deliLink}
            }).done(
                Swal.fire({
                    title: `링크 보내기 성공!`
                })
            );
        }
    })
});
