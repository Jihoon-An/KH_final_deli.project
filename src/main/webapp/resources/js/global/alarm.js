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

    //알림박스 추가 함수
    function createAlarmBox(data) {
        $('#alarm_box').prepend(
            $('<div class="alarm">')
                .append($('<input type="hidden" class="notice_seq">')
                    .val(data.notice_seq))
                .append($('<div class="from_name">')
                    .append(data.from_name))
                .append($('<div class="notice_title">')
                    .append(data.notice_title))
                .append($('<div class="notice_content">')
                    .append(data.notice_content))
                .append($('<div class="notice_time">')
                    .append(data.notice_time))
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
        );
    }

    //알림 기존 알림 추가하기
    function init() {
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
    }
    init();

    // WS 연결 테스트
    var alarmWS = new WebSocket("ws://localhost/alarmWS");
    alarmWS.onopen = (ev) => {
        console.info("Server와 연결되었습니다.");
    };

    // WebSocket 에서 오는 데이터 확인하기
    alarmWS.onmessage = (ev) => {
        let data = JSON.parse(ev.data);
        console.log(data);
        createAlarmBox(data);
    };

    alarmWS.onclose = (ev) => {
        console.info('Server와 연결이 해제되었습니다.');
    };

    alarmWS.onerror = () => {
        console.error("WebSocket ERROR!!");
    };

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

    const UserType = {
        OWNER: "business",
        MEMBER: "client",
        ADMIN: "admin"
    }

    // WebSocket 메세지 보내기
    $("#test_btn").click(() => {
        sendAlarm(83, null, "짱이지", "와 진짜 짱이다");
    });
});


