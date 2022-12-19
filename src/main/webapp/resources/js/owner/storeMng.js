function fileToBase64(file) {
    const reader = new FileReader();
    reader.readAsDataURL(file)
    reader.onload = () => {
        console.dir(reader.result)   // base64
        $("#profile").attr("src", reader.result);
    }
}

$("#profile_img").on("change", function () {
    if ($("#profile_img").val() == "") {
        $("#profile").attr("src", "/resources/img/store/no_storelogo.png");
        return;
    }
    console.log($("#profile_img").val());
    let ext = $("#profile_img").val().split(".").pop().toLowerCase();

    let accept = ["png", "jpg", "jpeg", "gif"];

    let result = $.inArray(ext, accept); //첫번쨰 인자값이 두번쨰 인자 배열 안에 존재한다면 배열 인덱스 반환(0이상값 반환),  존재하지않으면 -1 반환
    console.log(result);


    if (result == -1) {
        alert("이미지만 사용 가능합니다")
        $("#profile_img").val("");//비워주기
        $("#profile").attr("src", "/resources/img/store/no_storelogo.png")//다른 사진들어올떄 #profile 도 비워주기


    } else {
        fileToBase64(document.getElementById("profile_img").files[0]);
    }



});

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


