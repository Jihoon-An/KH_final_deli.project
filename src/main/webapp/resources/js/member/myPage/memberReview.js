
$("#back").on("click", function () {
    location.href = "/";
})


$("#revImgBtn").on("change", function () {

    let ext = $("#revImgBtn").val().split(".").pop().toLowerCase();// 업로드한 파일명을 점을 기준으로 배열을 만들고 마지막 배열의 값을 꺼내고 소문자로 만들어줌
    let accept = ["png", "jpg", "jpeg", "gif"]; // 업로드 가능한 파일 타입을 배열로 만듦
    let result = $.inArray(ext, accept);// 첫번째 인자값이, 두번째 인자 배열안에 존재한다면 0이상, 존재하지 않는다면 -1을 반환
    if (result == -1) {
        alert("이미지만 사용 가능합니다.");
        $("#revImgBtn").val("");// accept에 없는 파일을 올릴 경우 경고창을 띄우면서 업로드한 파일을 지움

    }else {
       console.log("SSSSSSSSSSSSSSSSSSS"+$("input[type=file]").length);
        if($("input[type=file]").length>4){
            alert("파일은 최대 5개까지만 업로드 가능합니다.");
            return;
        }
        fileToBase64(document.getElementById("revImgBtn").files[0]);

    }
})

// function fileToBase64(file) {
//     const reader = new FileReader();
//     reader.readAsDataURL(file)
//     reader.onload = () => {
//         // console.dir(reader.result)   // base64
//         console.log("reader.length"+file.length);
//
//             $("#imgtest").attr("src", reader.result);
//
//     }
// }
//
// let revImgBtn = $("#revImgBtn");
//
// revImgBtn.on("click",()=>{
//     let fr=new FileReader();
//     fr.readAsText( )
// })




//글자 수
$("#revContent").on("keyup",function (){
    let content = $(this).val();
    $("#count").html(content.length+" / 300");

    if(content.length > 300){
        alert("리뷰는 최대 300글자까지 입력 가능합니다.");
    }
})

    
//작성
$("#writeBtn").on("click", function () {






    //사진여부확인
    if ($("#revImgBtn").val() == "") {
        $("#rev_sysmname").attr("value","0");
    }else{
        $("#rev_sysmname").attr("value","1");
    }

    //별점 0점 제한
    if($("input[name=rev_star]:radio:checked").length<1){
        alert("별점");
        return false;
    }

    //글자수 제한
    let content = $("#revContent").val();

    if(content.length>300){
        alert("리뷰는 최대 300글자까지 입력 가능합니다.")
        return false;
    }




    $("#reviewPost").submit();
})




//해야할 거
// 글자수 제한 👌
//사진 제한
//별점 0점 제한 👌
//사진 미리보기
//사진 개별 삭제 기능


