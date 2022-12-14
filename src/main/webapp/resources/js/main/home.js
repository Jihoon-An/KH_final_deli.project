$("#emailSave").on("change" ,()=>{
    if ($("#emailSave").val("")) {
        $.ajax({
            url: "/account/deleteSavedEmail",
            type: "post"
        }).done(function(response){
            console.log(response);
        });
    }
});