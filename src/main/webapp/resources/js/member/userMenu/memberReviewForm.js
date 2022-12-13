$("#revImgBtn").on("change",function(){
    // if($("#revImgBtn").val()==""){
    //     $("#profile").attr("src","/images/profile.png");
    //     return;
    // }
    let ext = $("#revImgBtn").val().split(".").pop().toLowerCase();// 업로드한 파일명을 점을 기준으로 배열을 만들고 마지막 배열의 값을 꺼내고 소문자로 만들어줌
    let accept =["png","jpg","jpeg","gif"]; // 업로드 가능한 파일 타입을 배열로 만듦
    let result = $.inArray(ext,accept);// 첫번째 인자값이, 두번째 인자 배열안에 존재한다면 0이상, 존재하지 않는다면 -1을 반환
    if(result == -1){
        alert("이미지만 사용 가능합니다.");
        $("#revImgBtn").val("");// accept에 없는 파일을 올릴 경우 경고창을 띄우면서 업로드한 파일을 지움
    }


    fileToBase64(document.getElementById("revImgBtn").files[0]);
})