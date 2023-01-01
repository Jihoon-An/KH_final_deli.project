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
                // $("<i class=\"fa-solid fa-x del_img_btn\"></i>").append(
                    $("<i class=\"fa-solid fa-x del_img_btn\"></i>")
                        .click(function () {
                            $(this).closest(".review_img_div").remove();
                        })
                        // .text("X")
                .append(
                    $("<img style='width: 100%; height: 200px;'>")
                        .attr("src", e.target.result)
                ).append(
                    $("<input type='hidden' class='img_name'>")
                        .val(f.name)
                )
            );
        }
        reader.readAsDataURL(f);
    });
}

//글자 수
$("#revContent").on("keyup", function () {
    let content = $(this).val();
    $("#count").html(content.length + " / 300");

    if (content.length > 300) {
        alert("리뷰는 최대 300글자까지 입력 가능합니다.");
        $(this).val($(this).val().substring(0, 300))
        $("#count").html("300 / 300");
    }
})

let text_length = $("#revContent").val().length;
$("#text_count").html(text_length);

let text = $("#revContent").val();

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

$("#modifyBtn").on("click", function () {
    let text = $("#revContent").val();
    return response(text);
})
