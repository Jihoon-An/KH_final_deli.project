$("#optionBtn").on("click", function () {
    let store_seq = $(this).siblings($(".storeOption")).val();
    let startDate = $("#startDate").val();
    let endDate = $("#endDate").val();
    console.log(store_seq);
    console.log(startDate);
    console.log(endDate);

    $.ajax({
        url:"/owner/selectSales",
        type: "post",
        data: {
            store_seq:store_seq,
            startDate:startDate,
            endDate:endDate
        },
        dataType:"json"
    }).done(function (data){
            console.log(data);
    })

})


$("#startDate").on("change",function (){
    let startDateRange=$("#startDate").val();

    let now_utc = Date.now()
    let timeOff = new Date().getTimezoneOffset()*60000;
    let today = new Date(now_utc-timeOff).toISOString().substring(0, 16);

    $("#startDate").attr("max",today);
    if(startDateRange > today){
        alert("오늘 이후로 ㄴㄴ");
        $("#startDate").val("");
    }

})


$("#endDate").on("change",function (){
    let endDateRange=$("#endDate").val();
    let startDateRange=$("#startDate").val();

    $("#endDate").attr("min",startDateRange);
    if(endDateRange < startDateRange){
        alert("더 적은 날짜로 ㄱㄱ");
        $("#endDate").val("");
    }
})
