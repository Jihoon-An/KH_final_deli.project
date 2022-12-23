


//옵션추가
$(document).on("click", ".btn_option_add", function () {




    let add_box = $("<div class='option_div_add'>");


    let delBtn = $("<button type='button'>")
    delBtn.append("옵션삭제");


    delBtn.addClass("btn_del_option").on("click", function () {
        $(this).closest(".option_div_add").remove();

    });
    add_box.append(delBtn)
    add_box.append(" <select name='option_required' class='required'> <option value='Y'>필수옵션</option> <option value='N'>선택옵션</option></select><select name='option_multiple' class='opmulti'>  <option value='Y'>중복가능</option><option value='N'>중복불가능</option></select>  <input type='text' placeholder='옵션그룹명을 입력하세요' name='option_group' class='opgroup'><br><div class='group'> <div class='optionName_div'><input type='text' placeholder='옵션명을 입력하세요' name='option_name' class='opname'>  <input type='text' placeholder='옵션가격을 입력하세요' name='option_price' class='opprice'> </div> <button type='button' class='btn_opnameadd'>옵션명추가</button><br></div></div>")

    add_box.hide();

    $(this).closest(".option_div").find(".option_div2").append(add_box); //버튼뒤에 생성

    add_box.fadeIn(1000);

})


//옵션명추가버튼

$(document).on("click", ".btn_opnameadd", function () {





    let opadd_box = $("<div class='optionName_div_add'>");

    let delBtn = $("<button type='button'>")
    delBtn.append("X");


    delBtn.addClass("del_btn").on("click", function () {
        $(this).closest(".optionName_div_add").remove();
        addBtnCount=addBtnCount-1;
    });
    opadd_box.append(delBtn)
    opadd_box.append("<input type='text' placeholder='옵션명을 입력하세요' name='option_name' class='opname'> <input type='text' placeholder='옵션가격을 입력하세요' name='option_price' class='opprice'> </div> <br> ")


    //  $(this).closest(".name_add_box").append("<div class='text-start' style='width: 350px'> <span style='color: #808080; font - size:x-small'>옵션명</span></div> <input type='text' id='option_name_input' name='option_name' class='option_name' placeholder='옵션명을 입력하세요' maxlength='20'><div class='text - start' style='width: 350px'><span span style = 'color: #808080; font-size: x-small' > 옵션가격</span ></div > <input type='text' id='option_price_input' name='option_price' class='option_price'placeholder = '옵션 가격' maxlength = '11' oninput = validNum() > ")

    opadd_box.hide();
    $(this).closest(".group").find(".optionName_div").append(opadd_box);
    //버튼뒤에 생성

    opadd_box.fadeIn(1000);

})





$(".btn_add").on("click", function () {


   // let selb = $("select[name=option_required] option:selected").val();
    // let sela = document.querySelectorAll(".required:selected")
    let opgroup = document.querySelectorAll(".opgroup");
    console.log(opgroup)
    console.log(opgroup.length)
    let sela = document.querySelectorAll(".required");
    console.log(sela)
    console.log(sela.length)
    let multiple = document.querySelectorAll(".opmulti");
    //중첩for문돌리예정
    //let opgroup = $(".opgroup").val();

    //let dupl = document.querySelectorAll(".dupli");

    let menu_seq;

    //menu seq를 메뉴테이블, 메뉴 옵션테이블에 각각 추가하기 위한 조치
    $.ajax({
        url: "/menu/add/getMenuSeq",
        type: "get",
    }).done(res => {
        menu_seq = res
        //메뉴 옵션추가
        for(let i=0; i<opgroup.length; i++ ) { //중첩 for문 사용
            let opname= $(document.querySelectorAll(".group")[i]).find(".opname")
            let opprice = $(document.querySelectorAll(".group")[i]).find(".opprice")
            //기본 opname 길이 2
            for (let j = 0; j < opname.length; j++) {

                let opnameVal = opname[j].value;
                let oppriceVal = opprice[j].value;

                let data = {
                    "menu_seq":menu_seq,
                    "option_required": sela[i].value,
                    "option_multiple":multiple[i].value,
                    "option_group": opgroup[i].value,
                    "option_name": opnameVal,
                    "option_price": Number(oppriceVal)
                }

                console.log(data)
                $.ajax({
                    url: "/menu/add/menuAddAjax",
                    type: "post",
                    data: data
                })

                //메뉴추가
                $("#frm").attr("action","/menu/add/menuAdd?menu_seq="+menu_seq);
                  $("#frm").submit();

            }
        }


    })

    console.log(menu_seq)

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

$("#menu_img").on("change", function () {
    if ($("#menu_img").val() == "") {
        $("#profile").attr("src", "/resources/img/store/no_storelogo.png");
        return;
    }
    console.log($("#menu_img").val());
    let ext = $("#menu_img").val().split(".").pop().toLowerCase();

    let accept = ["png", "jpg", "jpeg", "gif"];

    let result = $.inArray(ext, accept); //첫번쨰 인자값이 두번쨰 인자 배열 안에 존재한다면 배열 인덱스 반환(0이상값 반환),  존재하지않으면 -1 반환
    console.log(result);


    if (result == -1) {
        alert("이미지만 사용 가능합니다")
        $("#menu_img").val("");//비워주기
        $("#profile").attr("src", "/resources/img/store/no_storelogo.png")//다른 사진들어올떄 #profile 도 비워주기


    } else {
        fileToBase64(document.getElementById("menu_img").files[0]);
    }
});
