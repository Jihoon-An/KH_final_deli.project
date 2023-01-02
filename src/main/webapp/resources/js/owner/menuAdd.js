
//input 칸 안에 숫자값 외에 값 받지 않기
function validNum() {
    event.target.value = event.target.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');

}



//메뉴 유효성
function menuSubmitCheck() {

    if ($("#menu_group").val() == "") {

        $("#menu_group").focus();


    }

    else if($("input[name=menu_sold_out]:radio:checked").length<1){
        Swal.fire({title: "체크 필수", icon: "error", text: "주문 가능 여부를 체크 해주세요"});
        return false;
    }
    else if($("input[name=menu_display]:radio:checked").length<1){
        Swal.fire({title: "체크 필수", icon: "error", text: "메뉴 공개 여부를 체크해주세요"});
        return false;
    }

    else if ($("#menu_name").val() == "") {
S
        $("#menu_name").focus();
    }
    else if ($("#menu_price").val() == "") {

        $("#menu_price").focus();
    }else if ($("#menu_price").val() <=100) {
            alert("메뉴100원이상입력")
        $("#menu_price").focus();

    }
    else if ($("#menu_img").val()=="") {


    }
    else if ($("#menu_intro").val() == "") {

        $("#menu_intro").focus();
    }

    else {
        // Swal.fire({title: "등록 성공", icon: "success", text: "등록이 완료되었습니다"});
        return true;
    }
    // Swal.fire({title: "등록 실패", icon: "error", text: "등록에 실패하였습니다. 관리자에게 문의해주세요"});
    return false;
}
//메뉴옵션 유효성
function menuOptionCheck2(){

    let opGroup = document.querySelectorAll(".op_group");
    let valid =true;
    for(let i=0; i<opGroup.length; i++ ) { //중첩 for문 사용
        let opName = $(document.querySelectorAll(".group")[i]).find(".op_name")
        let opPrice = $(document.querySelectorAll(".group")[i]).find(".op_price")
        //기본 opname 길이 2
        let opGroupval= opGroup[i].value;
        for (let j = 0; j < opName.length; j++) {

            let opNameVal= opName[j].value;
            let opPriceVal = opPrice[j].value;

            if(opPriceVal==""){
                // alert("가격값없으")
                valid=false
            }
            else if(opNameVal==""){
                // alert("이름값없음")
                valid=false
            }else if(opGroupval==""){
                // alert("그룹이름값 없으")
                valid=false
            }
        }
    }
    if(!valid){
        // Swal.fire({title: "유효성 통과실패", icon: "error", text: "메뉴옵션 유효성 검사 실패"});
        return false
    }else{
        //  Swal.fire({title: "유효성 통과성공", icon: "success", text: "메뉴옵션 유효성 검사 통과"});
        return valid;
    }
}



// var section1s = document.getElementsByClassName("section1");
// var section2s = document.getElementsByClassName("section2");
//
// for( var i = 0; i < section1s.length; i++ ){
//     var section1 = section1s.item(i);
//     section1.style.border = "1px solid #0000ff";
// }
//
// for( var i = 0; i < section2s.length; i++ ){
//     var section2 = section2s.item(i);
//     section2.style.border = "1px solid #ff0000"
// }

//옵션추가
$(document).on("click", ".btn_option_add", function () {

    let addBox = $("<div class='option_div_add'>");

    let delBtn = $("<button type='button'>")
    delBtn.addClass("deli_btn")
    delBtn.append("옵션삭제");


    delBtn.addClass("btn_del_option").on("click", function () {
        $(this).closest(".option_div_add").remove();

    });
    addBox.append(delBtn)
    addBox.append(" <select name='option_required' class='required'> <option value='Y'>필수옵션</option> <option value='N'>선택옵션</option></select><select name='option_multiple' class='op_multi'>  <option value='Y'>중복가능</option><option value='N'>중복불가능</option></select>  <input type='text' placeholder='옵션그룹명을 입력하세요' name='option_group' class='op_group'><br><div class='group'> <div class='optionName_div'><input style='width: 200px' type='text' placeholder='옵션명을 입력하세요' name='option_name' class='op_name'>  <input style='width: 150px;'  type='text' placeholder='옵션가격' name='option_price' class='op_price' oninput=validNum()>원 &nbsp;&nbsp;<button type='button' class='btn_opnameadd deli_btn'>+</button></div> <br></div></div>")

    addBox.hide();

    $(this).closest(".option_div").find(".option_div2").append(addBox); //버튼뒤에 생성

    addBox.fadeIn(1000);

})


//옵션명추가버튼

$(document).on("click", ".btn_opnameadd", function () {





    let opAddBox = $("<div class='optionName_div_add'>");

    let delBtn = $("<button type='button'>")
    delBtn.addClass("deli_btn")
    delBtn.append("X");


    delBtn.addClass("del_btn").on("click", function () {
        $(this).closest(".optionName_div_add").remove();
        addBtnCount=addBtnCount-1;
    });
    opAddBox.append(delBtn)

    opAddBox.append("<input type='text' placeholder='옵션명을 입력하세요' name='option_name' class='op_name'> <input  style='width: 150px;'type='text' placeholder='옵션가격' name='option_price' class='op_price' oninput=validNum()>원</div> <br> ")


    //  $(this).closest(".name_add_box").append("<div class='text-start' style='width: 350px'> <span style='color: #808080; font - size:x-small'>옵션명</span></div> <input type='text' id='option_name_input' name='option_name' class='option_name' placeholder='옵션명을 입력하세요' maxlength='20'><div class='text - start' style='width: 350px'><span span style = 'color: #808080; font-size: x-small' > 옵션가격</span ></div > <input type='text' id='option_price_input' name='option_price' class='option_price'placeholder = '옵션 가격' maxlength = '11' oninput = validNum() > ")

    opAddBox.hide();
    $(this).closest(".group").find(".optionName_div").append(opAddBox);
    //버튼뒤에 생성

    opAddBox.fadeIn(1000);

})





$(document).on("click",".btn_add", function () {


    // let selb = $("select[name=option_required] option:selected").val();
    // let sela = document.querySelectorAll(".required:selected")
    let opGroup = document.querySelectorAll(".op_group");
    console.log(opGroup)
    console.log("그룹길이"+opGroup.length)
    let sela = document.querySelectorAll(".required");
    console.log(sela)
    console.log(sela.length)
    let multiPle = document.querySelectorAll(".op_multi");
    //중첩for문돌리예정
    //let opgroup = $(".opgroup").val();


    let menuSeq;
    console.log(menuSubmitCheck())


    if(opGroup.length!=0) {

        if (!menuSubmitCheck() || !menuOptionCheck2()) {
            Swal.fire({title: "등록 실패", icon: "error", text: "옵션등록에 실패하였습니다. 관리자에게 문의해주세요"});
            return false;
        }

    }else {
        if (!menuSubmitCheck()) {
            Swal.fire({title: "등록 실패", icon: "error", text: "메뉴등록에 실패하였습니다. 관리자에게 문의해주세요"});
            return false;
        }

    }






    //menu seq를 메뉴테이블, 메뉴 옵션테이블에 각각 추가하기 위한 조치
    $.ajax({
        url: "/owner/menu/add/getMenuSeq",
        type: "get",
    }).done(res => {
        menuSeq = res

        if(opGroup.length!=0){
            //메뉴 옵션추가
            for(let i=0; i<opGroup.length; i++ ) { //중첩 for문 사용
                let opName= $(document.querySelectorAll(".group")[i]).find(".op_name")
                let opPrice = $(document.querySelectorAll(".group")[i]).find(".op_price")
                //기본 opname 길이 2
                for (let j = 0; j < opName.length; j++) {

                    let opNameVal = opName[j].value;
                    let opPriceVal = opPrice[j].value;

                    let data = {
                        "menu_seq":menuSeq,
                        "option_required": sela[i].value,
                        "option_multiple":multiPle[i].value,
                        "option_group": opGroup[i].value,
                        "option_name": opNameVal,
                        "option_price": Number(opPriceVal)
                    }

                    console.log(data)
                    $.ajax({
                        url: "/owner/menu/add/menuAddAjax",
                        type: "post",
                        data: data
                    })
                    console.log("옵션ajax방문")
                }
            }
        }
        
        console.log("서브밋왜안되냐")
        //메뉴추가
        $("#frm").attr("action","/owner/menu/add/menuAdd?menu_seq="+menuSeq);
        //console.log(data)
         $("#frm").submit();

        console.log("서브밋왜안되냐2222")

    })

    // console.log(menu_seq)

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



$("#menu_group").on("keyup", function (){
    $(".menu_group_msg").css("color", "#001a41")
    $(".menu_group_msg").html("메뉴그룹명끼리 묶을땐 메뉴그룹 이름을 입력해주세요")
})