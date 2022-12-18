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