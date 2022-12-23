$(document).ready(function () {
    $('#order_table').DataTable(
        {
            language: lang_kor //or lang_eng
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

// 상태 바꾸기 버튼 이벤트
$("#status_btn").click(() => {
    let newStatus = $("#new_status").val();

    let checkBox = $("tbody .check_box");

    console.log();

});
