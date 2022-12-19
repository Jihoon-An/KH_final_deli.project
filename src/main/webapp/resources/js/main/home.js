

/**
 * 이메일 저장 해제 기능
 */
$("#emailSave").on("change" ,()=>{
    if (!$("#emailSave").is(":checked")) {
        $.ajax({
            url: "/account/deleteSavedEmail",
            type: "post"
        }).done(function(response){
            console.log(response);
        });
    }
});



