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

/* 아래로 옵션추가수정본*/

$("#addop").on("click", function(){

    $("#frm").submit();

    //  var bsnsarr = [];

    // let b = document.getElementsByClassName("option")
    // let c = document.getElementsByName("menu_option")
    // let option_group=document.getElementsByName("option_group");
    // console.log(option_group.value())
    // // let bs = document.getElementById("bsnsdata")
    //  var select = $('input[name=menu_option]:checked').val();
    //  console.log(select)

    // $.ajax({
    //     url:"/menu/add/menuAdd",
    //     type:"post",
    //     data:{
    //         option_group:select,
    //     }
    // })
    // for (let i = 0; i < b.length; i++) {

    //     //bsnsarr.push(b[i].value);
    //  bsnsarr.push(select[i].value);
    //  bsnsarr.push()


    // }
    //     console.log(bsnsarr)

    //  $(this).closest(".menufrm").find(".option1")

    //     console.log(a);
})

//옵션추가
// var menuOptionCount = 0;
// //메뉴옵션 박스
// var addBtnCount = 0;
// $("#btn_option_add").on("click", function () {

//     if ($(".option_name").val() != ""
//         && $(".option_price").val() != ""

//     ) {

//         addBtnCount++;

//         if (addBtnCount < 4) {
//             let add_box_main = $("<div class='col-12 menu_add_box_main'>");
//             let add_box = $("<div class='menu_add_box row'>")
//             add_box_main.append(add_box)
//             let delBtn = $("<a>")
//             delBtn.append("<i class='fa-solid fa-x' style='color:#808080'>");
//             delBtn.addClass("del").on("click", function () {
//                 $(this).closest(".menu_add_box_main").remove();
//             });
//             add_box.append(delBtn);

//             add_box.append("<p>필수, 선택옵션</p><span><label><input type='radio' class='menu_option' name='option" + ++menuOptionCount + "' value='필수'>필수</label><label><input type='radio' class='menu_option' name='option" + menuOptionCount + "' value='선택'>선택</label></span><input type='text' class='option_group' name='option_group' placeholder='옵션그룹명 입력'><div class='col-12'><div class='text-start' style='width:350px'><span style='color:#808080; font-size:x-small'>옵션명</span></div><input type='text' id='option_name_input' name='option_name' class='option_name' placeholder='옵션명을 입력하세요' maxlength='20'><div class='text-start' style='width:350px'><span style='color:#808080; font-size:x-small'>옵션가격</span></div><input type='text' id='option_price_input' name='option_price' class='option_price' placeholder='옵션가격을 입력하세요' maxlength='15' oninput=validNum()> <div class='opbtn'>  <button type='button' class='btn_outline btn_opnameadd' id='btn_optionname_add'>옵션명추가</button>   <p style='color: #808080;' class='text_mini'>옵션명 추가를 원하시면 버튼을 눌러  추가 정보를 입력해주세요.</p></div>")

//             add_box_main.hide();

//             $(".option1").append(add_box_main); //버튼뒤에 생성

//             add_box_main.fadeIn(1000);
//         } else {
//             Swal.fire({
//                 icon: 'error',
//                 title: '메뉴옵션 추가 불가',
//                 text: '더이상의 시설 추가가 불가능합니다. 관리자에게 문의해주세요.',
//             })
//             return;
//         }

//     } else {
//         Swal.fire({
//             icon: 'error',
//             title: '내용 미입력',
//             text: '모든 내용을 작성 후 추가해주세요.',
//         })
//         return;
//     }
// })



//옵션명추가버튼
$(".btn_opnameadd").on("click", function () {

    let opadd_box_main = $("<div class='col-12 name_add_box_main'>");
    let opadd_box = $("<div class='name_add_box row'>")

    opadd_box_main.append(opadd_box)
    let delBtn = $("<a>")
    delBtn.append("<i class='fa-solid fa-x' style='color:#808080'>");
    delBtn.addClass("del").on("click", function () {
        $(this).closest(".name_add_box_main").remove();
    });
    opadd_box.append(delBtn)
    opadd_box.append("<div class='text-start' style='width: 350px'> <span style='color: #808080; font - size:x-small'>옵션명</span></div> <input type='text' id='option_name_input' name='option_name' class='option_name option' placeholder='옵션명을 입력하세요' maxlength='20'><div class='text - start' style='width: 350px'><span span style = 'color: #808080; font-size: x-small' > 옵션가격</span ></div > <input type='text' id='option_price_input' name='option_price' class='option_price option' placeholder = '옵션 가격' maxlength = '11' oninput = validNum() > ")

    //  $(this).closest(".name_add_box").append("<div class='text-start' style='width: 350px'> <span style='color: #808080; font - size:x-small'>옵션명</span></div> <input type='text' id='option_name_input' name='option_name' class='option_name' placeholder='옵션명을 입력하세요' maxlength='20'><div class='text - start' style='width: 350px'><span span style = 'color: #808080; font-size: x-small' > 옵션가격</span ></div > <input type='text' id='option_price_input' name='option_price' class='option_price'placeholder = '옵션 가격' maxlength = '11' oninput = validNum() > ")

    opadd_box_main.hide();
    $(".opnamediv").append(opadd_box_main); //버튼뒤에 생성

    opadd_box_main.fadeIn(1000);
})

///이미지 미리보기

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
