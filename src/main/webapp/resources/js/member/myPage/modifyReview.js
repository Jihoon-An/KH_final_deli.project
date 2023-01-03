var fileArr = []; // 새로운 파일 바이너리 리스트
// var new_name_list = new Array();
var del_list = new Array(); // 기존에 있던 파일 중에 삭제하는 파일 이름 리스트
const imgMaxcnt = 4; // 사진 개수 제한
var orgImgCnt = document.getElementsByClassName("review_img_div").length; // 원래 있던 이미지 개수

$("#revImgBtn").on("change", function (e) {

    let ext = $("#revImgBtn").val().split(".").pop().toLowerCase();// 업로드한 파일명을 점을 기준으로 배열을 만들고 마지막 배열의 값을 꺼내고 소문자로 만들어줌
    let accept = ["png", "jpg", "jpeg", "gif"]; // 업로드 가능한 파일 타입을 배열로 만듦
    let result = $.inArray(ext, accept);// 첫번째 인자값이, 두번째 인자 배열안에 존재한다면 0이상, 존재하지 않는다면 -1을 반환
    if (result == -1) {
        alert("이미지만 사용 가능합니다.");
        $("#revImgBtn").val("");// accept에 없는 파일을 올릴 경우 경고창을 띄우면서 업로드한 파일을 지움
        //미리보기 삭제
    } else {
        handleImgFileSelect(e);
        imgCount();
        // fileToBase64(document.getElementById("revImgBtn").files[0]);
    }
})

// 업로드 이미지 개수 제한
function imgCount() {

    let dataTran = new DataTransfer();
    let fileInInput = $("#revImgBtn")[0].files;
    let fileInInputArr = Array.from(fileInInput);

    if (fileInInputArr.length + orgImgCnt > imgMaxcnt) {  // 새로 추가할 파일이 4가 넘으면
        $("#revImgBtn").val(""); //서버로 넘길 인풋 밸류 초기화
        if (fileArr.length != 0) {
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
    } else if (fileArr.length + fileInInputArr.length + orgImgCnt > imgMaxcnt) {   // 기존 파일과 새로 추가할 파일의 합이 4가 넘으면
        $("#revImgBtn").val(""); //서버로 넘길 인풋 밸류 초기화
        if (fileArr.length != 0) {
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
    } else {
        fileInInputArr.forEach(x => {
            fileArr.push(x);     // 기존 파일과 새 파일 합체
        });

        fileArr.forEach(x => {
            dataTran.items.add(x);
        });

        $("#revImgBtn")[0].files = dataTran.files;
    }
}

// function imgPreview() {
//     $("#imgSec").empty();
//     fileArr.forEach(function (f) {
//         let reader = new FileReader();
//         reader.onload = function (e) {
//             $("#rev_imgs_area")
//                 .append($("<div class='review_img_div'>")
//                     .append(
//                         // $("<i class=\"fa-solid fa-x del_img_btn\"></i>").append(
//                         // $("<i class=\"fa-solid fa-x del_img_btn\"></i>").append(
//                         $("<i class='fa-solid fa-x del_img_btn'></i>")
//                             .click(function () {
//                                 $(this).closest(".review_img_div").remove();
//                                 removeFileFromFileList(0);
//                             })
//                     )
//                     // .text("X")
//                     .append(
//                         $("<img style='width: 100%; height: 200px;'>")
//                             .attr("src", e.target.result)
//                     ).append(
//                         $("<input type='hidden' class='img_name'>")
//                             .val(f.name)
//                     )
//                 );
//         }
//         reader.readAsDataURL(f);
//     })
// }


//내 리뷰 관리로 이동
$("#backBtn").on("click", function () {
    location.href = "/myPage/reviewList";
})

//지우기
$(".del_img_btn").on("click", del_img_btn_event);


function del_img_btn_event() {
    let rev_img_div = $(this).closest(".review_img_div");

    del_list.push(rev_img_div.find(".img_name").val());

    $("#del_files_json").val(JSON.stringify(del_list));
    orgImgCnt -= 1;
    $(rev_img_div).remove();
}

// $('#revImgBtn').on('change', handleImgFileSelect);

//이미지 미리보기
function handleImgFileSelect(e) {
    var files = e.target.files;
    var newFilesArr = Array.prototype.slice.call(files);
    var reg = /(.*?)\/(jpg|jpeg|png|bmp|pdf|gif)$/;

    if (newFilesArr.length + fileArr.length + orgImgCnt <= imgMaxcnt) {
        newFilesArr.forEach(function (f, index) {
            if (!f.type.match(reg)) {
                Swal.fire({
                    icon: 'error',
                    title: '이미지 업로드 불가',
                    text: '이미지 파일만 업로드 가능합니다.',
                    confirmButtonText: '확인'
                })
                return;
            }
            sel_file = f;
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#rev_imgs_area")
                    .append($("<div class='review_img_div'>")
                        .append(
                            // $("<i class=\"fa-solid fa-x del_img_btn\"></i>").append(
                            // $("<i class=\"fa-solid fa-x del_img_btn\"></i>").append(
                            $("<i class='fa-solid fa-x del_img_btn new_del'></i>")
                                .click(function () {
                                    $(this).closest(".review_img_div").remove();

                                    removeFileFromFileList($(this).attr("index"));

                                    let newIndex = 0;
                                    $(".new_del").each(function () {
                                        $(this).attr("index", newIndex);
                                        newIndex += 1;
                                    });
                                })
                                .attr("index", index)
                        )
                        // .text("X")
                        .append(
                            $("<img style='width: 135px; height: 135px;' class='preimg_img'>")
                                .attr("src", e.target.result)
                        ).append(
                            $("<input type='hidden' class='img_name'>")
                                .val(f.name)
                        ).append(
                            $("<button type='button' onclick='del_img_btn(this)' class='delBtn'><i class=\"fa-regular fa-circle-xmark\"></i></button>")
                        )
                    );
            }
            reader.readAsDataURL(f);
        });
    };
}


function response(text) {
    var words = ["씨발", "시발", "ㅅㅂ", "tq", "병신", "멍청이", "바보",
        "새끼", "미친", "존나", "좆같네", "좆같다", "지랄", "염병", "썅",
        "개같은", "새키", "족같네", "씨팔", "죽어", "죽여", "자살", "놈", "년",
        "씹", "씨벌", "개색기", "종나", "카악", "퉤", "퉷", "족같네"];
    for (let n = 0; n < words.length; n++) {
        if (text.includes(words[n])) {
            Swal.fire({
                icon: 'error',
                title: '필터 감지',
                text: words[n] + ' 해당 단어는 사용 불가입니다',
                confirmButtonText: '확인'
            })
            return false;
        }
    }
    return true;
}


let text_length = $("#revContent").val().length;
$("#text_count").html(text_length);

let text = $("#revContent").val();
//글자 수
$("#revContent").on("keyup", function () {
    let content = $(this).val();
    $("#count").html(content.length + " / 300");

    if (content.length > 300) {
        $(this).val(content.substring(0, 300));
        Swal.fire({
            icon: 'error',
            title: '리뷰 업로드 불가',
            text: '리뷰는 최대 300글자까지 입력 가능합니다.',
            confirmButtonText: '확인',
            customClass: 'swal-wide'
        });
        $("#count").html("300 / 300");
    }
})

// $(function(){
//     $("button[type = 'submit']").click(function(){
//         var $fileUpload = $("button[type='submit']");
//         if (parseInt($fileUpload.get(0).files.length) > 3){
//             alert("You are only allowed to upload a maximum of 3 files");
//             return false;
//         }
//     });
// });
//
// var uploadField = document.getElementById("files");
// uploadField.onchange = function() {
//     if(this.files[0].size > 2097152){
//         alert("File is too big!");
//         this.value = "";
//     };
// };

//수정
$("#modifyBtn").on("click", function () {

    let text_length = $("#revContent").val().length;
    $("#text_count").html(text_length);

    let text = $("#revContent").val();

    return response(text);

    let size = 0;
    const maxSize = 1024 * 1024 * 10;

    for (i = 0; i < fileArr.length; i++) {
        size += fileArr[i].size;
    }

    //이미지 크기
    if (size > maxSize) {
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
        $("#rev_sysmname").attr("value", "0");
    } else {
        $("#rev_sysmname").attr("value", "1");
    }

    //별점 0점 제한
    if ($("input[name=rev_star]:radio:checked").length < 1) {
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

    if (content.length > 300) {
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

function removeFileFromFileList(index) {
    const dt = new DataTransfer()
    const input = document.getElementById('revImgBtn')
    const {files} = input

    fileArr.splice(index, 1);

    for (let i = 0; i < files.length; i++) {
        const file = files[i]
        if (index != i)
            dt.items.add(file) // here you exclude the file. thus removing it.
    }

    input.files = dt.files // Assign the updates list
}




