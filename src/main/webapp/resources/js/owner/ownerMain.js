$("#optionBtn").on("click", function () {
    let store_seq = $(this).siblings($(".storeOption")).val();
    let startDate = $("#startDate").val();
    let endDate = $("#endDate").val();

    startDate=startDate.replace(/-/g, '');
    endDate=endDate.replace(/-/g, '');

    console.log("시작 시간 스트링"+startDate+" ; "+endDate);
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
            $(".storeSales").empty();
            let r='';
            for (i = 0; i < data.length; i++) {
                r+="<div><span>날짜 : "+data[i].daily_date+"</span> - <span>매출 : "+data[i].daily_sales+"</span></div>";
            }
            $(".storeSales").append(r);
    })

})

let now_utc = Date.now()
let timeOff = new Date().getTimezoneOffset()*60000;
let today = new Date(now_utc-timeOff).toISOString().substring(0, 16);

$("#startDate").on("change",function (){
    let startDateRange=$("#startDate").val();

    $("#startDate").attr("max",today);
    if(startDateRange > today){
        alert("오늘 이전으로 ㄱㄱ");
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

    $("#endDate").attr("max",today);
    if(endDateRange > today){
        alert("오늘 이 ㄱㄱ");
        $("#endDate").val("");
    }
})

$(document).ready(function () {
    document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
    document.getElementById('endDate').value = new Date().toISOString().substring(0, 10);
})




////////////
const ctx = document.getElementById('myChart');

new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

