var new_name_list = new Array();
var del_list = new Array();

//내 리뷰 관리로 이동
$("#backBtn").on("click", function () {
    location.href = "/";
})

//지우기
$(".del_img_btn").on("click", del_img_btn_event)
function del_img_btn_event() {
    let rev_img_div = $(this).closest(".review_img_div");

    del_list.push(rev_img_div.find(".img_name").val());
    console.log(del_list);

    $("#del_files_json").val(JSON.stringify(del_list));

    $(rev_img_div).remove();
}

$('#revImgBtn').on('change', handleImgFileSelect);

//이미지 미리보기
function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);
    var reg = /(.*?)\/(jpg|jpeg|png|bmp|pdf|gif)$/;
    filesArr.forEach(function (f) {
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
            $("#rev_imgs_area").append(
                $("<div class='review_img_div'>").append(
                    $("<img style='width: 200px; height: 200px;'>")
                        .attr("src", e.target.result)
                ).append(
                    $("<input type='hidden' class='img_name'>")
                        .val(f.name)
                ).append(
                    $("<button type='button' class='del_img_btn'>")
                        .click(function () {
                            $(this).closest(".review_img_div").remove();
                        })
                        .text("지우기")
                )
            );
        }
        reader.readAsDataURL(f);
    });
}

//글자 수
$("#revContent").on("keyup",function (){
    let content = $(this).val();
    $("#count").html(content.length+" / 300");

    if(content.length > 300){
        alert("리뷰는 최대 300글자까지 입력 가능합니다.");
        $(this).val($(this).val().substring(0,300))
    }
    let text_length=$("#revContent").val().length;
    $("#text_count").html(text_length);
})


$("#modifyBtn").on("click",function(){
    let content = $("#revContent").val();

    if(content.length>300){
        alert("리뷰는 최대 300글자까지 입력 가능합니다.")
        return false;
    }

    $("#reviewPost").submit();
})

let text_length=$("#revContent").val().length;
$("#text_count").html(text_length);