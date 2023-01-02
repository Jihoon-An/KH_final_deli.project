
let fileArr =[];
const imgMaxcnt=4; // 사진 개수 제한

$("#revImgBtn").on("change", function (e) {

    let ext = $("#revImgBtn").val().split(".").pop().toLowerCase();// 업로드한 파일명을 점을 기준으로 배열을 만들고 마지막 배열의 값을 꺼내고 소문자로 만들어줌
    let accept = ["png", "jpg", "jpeg", "gif"]; // 업로드 가능한 파일 타입을 배열로 만듦
    let result = $.inArray(ext, accept);// 첫번째 인자값이, 두번째 인자 배열안에 존재한다면 0이상, 존재하지 않는다면 -1을 반환
    if (result == -1) {
        alert("이미지만 사용 가능합니다.");
        $("#revImgBtn").val("");// accept에 없는 파일을 올릴 경우 경고창을 띄우면서 업로드한 파일을 지움
        //미리보기 삭제
    }else {

        imgCount();

        imgPreview();

        fileToBase64(document.getElementById("revImgBtn").files[0]);
    }
})

// 업로드 이미지 개수 제한
function imgCount(){

    let dataTran = new DataTransfer();
    let fileInInput=$("#revImgBtn")[0].files;

    let fileInInputArr=Array.from(fileInInput);

    if(fileInInputArr.length>imgMaxcnt){  // 새로 추가할 파일이 4가 넘으면
        $("#revImgBtn").val(""); //서버로 넘길 인풋 밸류 초기화
        if(fileArr.length!=0){
            fileArr.forEach(x => {
                dataTran.items.add(x);   // 기존 파일이 있으면 그 값으로 대체
            });
            $("#revImgBtn")[0].files = dataTran.files;
        }
        Swal.fire({
            icon: 'error',
            title: '이미지 업로드 불가',
            text: '이미지는 최대 4개까지 업로드 가능합니다.',
            confirmButtonText: '확인'
        });
    }else if(fileArr.length+fileInInputArr.length>imgMaxcnt){   // 기존 파일과 새로 추가할 파일의 합이 4가 넘으면
        $("#revImgBtn").val(""); //서버로 넘길 인풋 밸류 초기화
        if(fileArr.length!=0){
            fileArr.forEach(x => {
                dataTran.items.add(x);   // 기존 파일이 있으면 그 값으로 대체
            });
            $("#revImgBtn")[0].files = dataTran.files;
        }
        Swal.fire({
            icon: 'error',
            title: '이미지 업로드 불가',
            text: '이미지는 최대 4개까지 업로드 가능합니다.',
            confirmButtonText: '확인'
        });
    }else{

        fileInInputArr.forEach(x => {
            fileArr.push(x);     // 기존 파일과 새 파일 합체
        });

        fileArr.forEach(x => {
            dataTran.items.add(x);
        });

        $("#revImgBtn")[0].files = dataTran.files;
    }
}


//이미지 미리보기
function imgPreview(){
    $("#imgSec").empty();
    fileArr.forEach(function (f) {
        let reader = new FileReader();
        reader.onload= function (e) {

            //미리보기
            $("#imgSec").append(
                $("<span class='review_img_div'>").append(
                    $("<img style='width: 135px; height: 135px;' class='preimg_img'>")
                        .attr("src", e.target.result)
                ).append(
                    $("<input type='hidden' class='img_name'>")
                        .val(f.name)
                ).append(
                    $("<button type='button' onclick='del_img_btn(this)' class='delBtn'><i class=\"fa-regular fa-circle-xmark\"></i></button>")
                )
            )
            console.log(fileArr.findIndex(i=>i.name==f.name));
        }
        reader.readAsDataURL(f);
    })
}


function del_img_btn(e){

    // input 해당 파일 삭제
    let filename=$(e).prev().val();
    let index=fileArr.indexOf(filename);
    fileArr.splice(index,1);
    console.log("파이ㅏㄹ 길이"+fileArr.length);

    let dataTran = new DataTransfer();
    if(fileArr.length!=0){
        fileArr.forEach(x => {
            dataTran.items.add(x);   // 기존 파일이 있으면 그 값으로 대체
        });
        $("#revImgBtn")[0].files = dataTran.files;
    }else{
        $("#revImgBtn").val("");
    }

    //미리보기
    $(e).parent().remove();


}

//글자 수
$("#revContent").on("keyup",function (){
    let content = $(this).val();
    $("#count").html(content.length+" / 300");

    if(content.length > 300){
        $(this).val(content.substring(0,300));
        Swal.fire({
            icon: 'error',
            title: '리뷰 업로드 불가',
            text: '리뷰는 최대 300글자까지 입력 가능합니다.',
            confirmButtonText: '확인'
        });
    }
})

    
//작성
$("#writeBtn").on("click", function () {

     let size=0;
     const maxSize=1024 * 1024 * 10;

     for(i=0;i<fileArr.length;i++){
         size+=fileArr[i].size;
     }

     console.log("이미지 사이즈  : "+size);
    //이미지 크기
    if(size>maxSize){
        Swal.fire({
            icon: 'error',
            title: '이미지 업로드 불가',
            text: '이미지의 용량이 큼 삭제 요망.',
            confirmButtonText: '확인'
        });
        return false;
    }
    
    
    //사진여부확인
    if ($("#revImgBtn").val() == "") {
        $("#rev_sysmname").attr("value","0");
    }else{
        $("#rev_sysmname").attr("value","1");
    }

    //별점 0점 제한
    if($("input[name=rev_star]:radio:checked").length<1){
        Swal.fire({
            icon: 'error',
            title: '별점 미입력',
            text: '별점 필수.',
            confirmButtonText: '확인'
        });
        return false;
    }

    //글자수 제한
    let content = $("#revContent").val();

    if(content.length>300){
        Swal.fire({
            icon: 'error',
            title: '리뷰 업로드 불가',
            text: '리뷰는 최대 300글자까지 입력 가능합니다.',
            confirmButtonText: '확인'
        });
        return false;
    }

    $("#reviewPost").submit();
})


