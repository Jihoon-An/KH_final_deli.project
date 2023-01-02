var interval;

$(document).ready(function () {


    //영역 생성
    $('body')
        //     < span
        //     className = "position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle" >
        //         < span
        //     className = "visually-hidden" > New
        //     alerts < /span>
        // </span>
        .append($('<span id="new_alarm_icon" style="font-size: 10px;">')
            .addClass("position-fixed top-5 start-30 translate-middle p-2 bg-danger border border-light rounded-circle"))
        .append($('<i id="alarm_icon">')
            .addClass("fa-solid fa-bell"))
        .append($('<div id="alarm_background">'))
        .append($('<div id="alarm_area">')
            .append($('<div id="alarm_box">'))
            .append($('<button id="alarm_close_btn" style="background-color: #e8f3de">')
                .html('<i class="fa-sharp fa-solid fa-chevron-up" style="color: #d52d2d; font-size: 30px"></i>')
            )
        );
    //display toggle 이벤트 부여
    $("#alarm_icon").click(function () {
        $('#alarm_background').toggle();
        $("#alarm_area").slideToggle(250);
        clearInterval(interval);
        $("#new_alarm_icon").css("display", "none");
    });
    $("#alarm_background").click(function () {
        $('#alarm_background').toggle();
        $("#alarm_area").slideToggle(250);
        clearInterval(interval);
        $("#new_alarm_icon").css("display", "none");
    });
    $("#alarm_close_btn").click(function () {
        $('#alarm_background').toggle();
        $("#alarm_area").slideToggle(250);
        clearInterval(interval);
        $("#new_alarm_icon").css("display", "none");
    });


    //sample
    for (let i = 0; i < 11; ++i) {
        createAlarmBox({
            notice_seq: 123,
            from_name: 'sdlfg',
            notice_title: "asd",
            notice_content: "asdqwe",
            notice_time: "asdad"
        })
    }


    alarmInit();


    // WS 연결 테스트
    var alarmWS = new WebSocket("ws://localhost/alarmWS");
    alarmWS.onopen = (ev) => {
        console.info("Server와 연결되었습니다.");
    };

    // WebSocket 에서 오는 데이터 확인하기
    alarmWS.onmessage = (ev) => {
        let data = JSON.parse(ev.data);
        console.log(data);
        interval = setInterval(function () {
            $("#new_alarm_icon").toggle();
        }, 500);
        createAlarmBox(data);
    };

    alarmWS.onclose = (ev) => {
        console.info('Server와 연결이 해제되었습니다.');
    };

    alarmWS.onerror = () => {
        console.error("WebSocket ERROR!!");
    };


    // WebSocket 메세지 보내기
    // $("#test_btn").click(() => {
    //     sendAlarm(83, null, "짱이지", "와 진짜 짱이다");
    // });
});

// 알림이 왔을 때 아이콘 이벤트 처리 해야함.


//알림박스 추가 함수
function createAlarmBox(data) {
    $('#alarm_box').prepend(
        $('<div class="alarm p-1">')
            .append($('<input type="hidden" class="notice_seq">')
                .val(data.notice_seq))
            .append($('<div class="row">')
                .append($('<div class="from_name col-9">')
                    .append(data.from_name))
                .append($('<div class="col-3 text-end">')
                    .append($('<button type="button" class="notice_del_btn">')
                        .append('X')
                        .click(function () {
                            let alarmLocation = $(this).closest(".alarm");
                            let del_seq = $(this).closest(".alarm").find(".notice_seq").val();
                            $.ajax({
                                url: '/alarm/delete',
                                type: "post",
                                contentType: 'application/json; charset=utf-8',
                                data: del_seq,
                                success: function () {
                                    $(alarmLocation).remove();
                                },
                            })
                        })
                    )
                )
            )
            .append($('<hr class="p-0 m-0">'))
            .append($('<div class="notice_title mb-1">')
                .append(data.notice_title))
            .append($('<div class="notice_content">')
                .append(data.notice_content))
            .append($('<div class="notice_time">')
                .append(data.notice_time))
    );
}

function sendAlarm(toAccSeq, user_type, title, content) {
    let sendData = new NoticeRequestDTO(toAccSeq, user_type, title, content);
    $.ajax({
        url: '/alarm/send',
        method: "post",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(sendData)
    });
}

function popUpAlarm() {

}

/**
 * 유저한명에게 보내고 싶은거면 to_acc_seq를 넣고
 * 같은 타입의 모든 유저에게 보내는거라면 user_type에 business, client, admin중 하나를 넣는다.
 * UserType 을 사용하여 넣으면 편하다.
 */
class NoticeRequestDTO {
    to_acc_seq;
    user_type;
    title;
    content;

    constructor(to_acc_seq, user_type, title, content) {
        this.to_acc_seq = to_acc_seq;
        this.user_type = user_type;
        this.title = title;
        this.content = content;
    }
}

const userType = {
    OWNER: "business",
    MEMBER: "client",
    ADMIN: "admin"
}


//알림 기존 알림 추가하기
function alarmInit() {
    $.ajax({
        url: '/alarm/getList',
        method: "post",
        dataType: 'json',
        success: function (list) {
            list.forEach((data) => {
                console.log(data);
                createAlarmBox(data);
            });
        }
    })
    $("#new_alarm_icon").css("display", "none");
}


