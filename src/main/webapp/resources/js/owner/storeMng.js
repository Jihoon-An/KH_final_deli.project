$(".bs").on("change", function () {
    if ($(this).val() == '영업일') {
        $(this).closest($(".bsnsdiv")).find($(".bs_time")).show();
    } else {
        $(this).closest($(".bsnsdiv")).find($(".bs_time")).find($(".bsns")).val("");
        $(this).closest($(".bsnsdiv")).find($(".bs_time")).hide();
    }
})

$("#add").on("click", function(){

    var bsnsarr = [];

    let b = document.getElementsByClassName("bsns")
    let bs = document.getElementById("bsnsdata")


    for (let i = 0; i < b.length; i++) {

        bsnsarr.push(b[i].value);

    }

    console.log(bsnsarr.toString())

    bs.value= bsnsarr.toString()

    console.log(bs.value)


    $("#frm").attr("action", "/store/add/storeAdd")
    $("#frm").submit()




})
//이미지미리보기
function fileToBase64(file){
    const reader = new FileReader();
    reader.readAsDataURL(file)
    reader.onload = () => {
        console.dir(reader.result)   // base64
        $("#profile").attr("src", reader.result);
    }
}
$("#profile_img").on("change", function(){
    if($("#profile_img").val()==""){
        $("#profile").attr("src", "/resources/img/store/no_storelogo.png");
        return;
    }
    console.log($("#profile_img").val());
    let ext=$("#profile_img").val().split(".").pop().toLowerCase();

    let accept=["png", "jpg", "jpeg", "gif"];

    let result=	$.inArray(ext, accept); //첫번쨰 인자값이 두번쨰 인자 배열 안에 존재한다면 배열 인덱스 반환(0이상값 반환),  존재하지않으면 -1 반환
    console.log(result);



    if(result==-1){
        alert("이미지만 사용 가능합니다")
        $("#profile_img").val("");//비워주기
        $("#profile").attr("src", "/images/no_profile.png")//다른 사진들어올떄 #profile 도 비워주기


    } else{
        fileToBase64(document.getElementById("profile_img").files[0]);
    }
});



$(document).on("click", ".postsearch", function() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            var geocoder = new kakao.maps.services.Geocoder();

            var callback = function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    let x=result[0].x;
                    let y= result[0].y;
                    console.log(x)
                    console.log(y)
                    document.getElementById("store_add_y").value = x;
                    document.getElementById("store_add_x").value = y;
                }
            };
            geocoder.addressSearch(addr, callback);


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("add1").value = data.roadAddress;
            document.getElementById("add1").value = data.jibunAddress;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("add2").focus();
        }
    }).open();
})

//식당 삭제
$("#deleteStoreBtn").click(function () {
    let store_seq=$(this).closest("#frm").find("#store_seq").val();
    var form=document.createElement("form");
    form.setAttribute('method','post');
    form.setAttribute('action','/store/mng/delete');

    let value = document.createElement('input');
    value.setAttribute('type', 'hidden');
    value.setAttribute('name', 'store_seq');
    value.setAttribute('value', store_seq);
    form.appendChild(value);

    document.body.appendChild(form);
    form.submit();

})


