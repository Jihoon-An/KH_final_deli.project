function getUrlParams() {
    var params = {};

    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi,
        function(str, key, value) {
            params[key] = value;
        }
    );

    return params;
}

window.onload = function (){
    oParams = getUrlParams();
    if(oParams.filter == "star"){
        $(".filter").eq(0).css("color","#e84c4f");
        // $(".filter").eq(0).css("font-weight","bolder");
    }
    if(oParams.filter == "review"){
        $(".filter").eq(1).css("color","#e84c4f");
        // $(".filter").eq(1).css("font-weight","bolder");
    }
    if(oParams.filter == "delifree"){
        $(".filter").eq(2).css("color","#e84c4f");
        // $(".filter").eq(2).css("font-weight","bolder");
    }
    if(oParams.filter == "minprice"){
        $(".filter").eq(3).css("color","#e84c4f");
        // $(".filter").eq(3).css("font-weight","bolder");
    }
}