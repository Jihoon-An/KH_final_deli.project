var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var markerPosition = new kakao.maps.LatLng(latitude, longitude);

var marker = new kakao.maps.Marker({
    position: markerPosition
});

marker.setMap(map);


$(".heart").on("click",function (){


    let store_seq=$(this).children().val();
    let heartIcon=$(this).find(".heartIcon");
    console.log("식당시퀀스 : "+store_seq);

    $.ajax({
        url:"/myPage/dibs/like",
        type: "post",
        data: {
            store_seq:store_seq
        }
    }).done(function (resp){
        if(resp==1){
            heartIcon.css('text-shadow','0 0 0 rgba(232,76,79)');
        }else {
            heartIcon.css('text-shadow','0 0 0 rgba(217, 216, 214, 0.99)');
        }
    })
});