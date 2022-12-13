
var confirm_num;
var confirm_count;

function countdown( elementName, minutes, seconds )
{
    var element, endTime, hours, mins, msLeft, time;

    function twoDigits( n )
    {
        return (n <= 9 ? "0" + n : n);
    }

    function updateTimer()
    {
        msLeft = endTime - (+new Date);
        if ( msLeft < 1000 ) {
            element.innerHTML = "시간초과";
        } else {
            time = new Date( msLeft );
            hours = time.getUTCHours();
            mins = time.getUTCMinutes();
            element.innerHTML = (hours ? hours + ':' + twoDigits( mins ) : mins) + ':' + twoDigits( time.getUTCSeconds() );
            setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
        }
    }

    element = document.getElementById( elementName );
    endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
    updateTimer();
}

$("#email_btn").on("click", function () {
    $.ajax({
        url: "/ownerSignUp/dupleCheck",
        type: "post",
        data: {email: $("#email").val()}
    }).done(function (result) {
        if (result == true) {
            Swal.fire({
                icon: 'error',
                title: '실패',
                text: '중복된 이메일입니다',
            })
        } else {
            Swal.fire('가입 가능한 이메일입니다.');
            // 이메일 보내기
            confirm_num = Math.floor(Math.random()*1000000)
            // $.ajax({
            //     url: "/mailCerti",
            //     type: "post",
            //     data: {
            //         address: $("#email").val(),
            //         title: "Deli email confirm",
            //         message: "<h1>"+email_confirm_num+"</h1>"
            //     }
            // });
            $("#email_confirm_table").css("display", "block");
            countdown("confirm_count", 0, 5);
        }
    });
});



// 폰인증 보류
// $("#phone_btn").on("click", function () {
//     $.ajax({
//         url: "/",
//         type: "post",
//         data: {email:$("#email").val()}
//     })
// });

$("email_confirm_btn").click(function () {

});