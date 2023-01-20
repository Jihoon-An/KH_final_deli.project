$(".heart").on("click",function (){

    let store_seq=$(this).children().val();
    let heartIcon=$(this).find(".heartIcon");

    $.ajax({
        url:"/myPage/dibs/like",
        type: "post",
        data: {
            store_seq:store_seq
        }
    }).done(function (resp){
        if(resp==1){
            heartIcon.css('text-shadow','0 0 0 rgba(232,76,79)');
        }else {
            heartIcon.css('text-shadow','0 0 0 rgba(217, 216, 214, 0.99)');
        }
    })
});




var soWhat;
var what;
var x,left,down;

$(".filter_box").mousedown(function(e,name){

    // console.log(e);
    // console.log(name);

    e.preventDefault();
    down = true;
    x = e.pageX;
    left = $(this).scrollLeft();


    what = e.currentTarget;

    // what = $(this);
    // soWhat = this;
    // console.log(what);
    // console.log(soWhat);

    $(what).mousemove(function(e1){
        if(down){
            var newX = e1.pageX;
            // $(soWhat).scrollLeft(left - newX + x);
            // $(what).scrollLeft(left - newX + x);

            // what.target().scrollLeft(left - newX + x);
            $(what).scrollLeft(left - newX + x);

            // console.log($(what[0]));
            // console.log("----------");
            // console.log($(what));
        }
    });

});


$("body").mouseup(function(e){down = false;});


