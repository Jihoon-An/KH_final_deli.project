$(document).ready(function () {
    //영역 생성
    $('body')
        .append($('<i id="alarm_icon">')
            .addClass("fa-sharp fa-solid fa-bell"))
        .append($('<div id="alarm_background">'))
        .append($('<div id="alarm_box">'));
    //display toggle 이벤트 부여
    $("#alarm_icon").click(function () {
        $('#alarm_background').toggle();
        $('#alarm_box').toggle('fast');
    });
    $("#alarm_background").click(function () {
        $('#alarm_background').toggle();
        $('#alarm_box').toggle('fast');
    });

    //알림 추가하기 테스트
    for (let i = 0; i < 11; ++i) {
        $('#alarm_box').append(
            $('<div class="alarm">')
        );
    }

    // WS 연결 테스트
    var alarmWS = new WebSocket("ws://localhost/alarmWS");
    alarmWS.onopen = (ev) => {
        console.log(ev);
    };

    // WebSocket 메세지 보내기
    $("#test_btn").click(() => {
        alarmWS.send($('#test_input').val());
    });

    // WebSocket 에서 오는 데이터 확인하기
    alarmWS.onmessage = (ev) => {
        console.log(ev);
    };

    alarmWS.onclose = (ev) => {
        console.log(ev);
    };

    alarmWS.onerror = (ev) => {
        console.log(this);
        console.log(ev);
    };

});

class NoticeRequestDTO{
    constructor(to_acc_seq, title, content) {
        this.to_acc_seq = to_acc_seq;
        this.title = title;
        this.content = content;
    }
}

class NoticeResponseDTO{
    notice_seq;
    from_name;
    notice_title;
    notice_content;
    notice_time;
    constructor(notice_seq, from_name, notice_title, notice_content, notice_time) {
        this.notice_seq = notice_seq;
        this.from_name = from_name;
        this.notice_title = notice_title;
        this.notice_content = notice_content;
        this.notice_time = notice_time;
    }
}

// Controller test
function testMessage() {
    $.ajax({
        url: '/alarm/send',
        method: "post"
    });
}
