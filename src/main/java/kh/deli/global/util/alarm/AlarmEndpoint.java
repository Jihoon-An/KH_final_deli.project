package kh.deli.global.util.alarm;

import com.google.gson.Gson;
import kh.deli.global.config.WebSocketConfig;
import kh.deli.global.entity.NoticeDTO;
import kh.deli.global.entity.UserType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

@Slf4j
@Service
@ServerEndpoint(
        value = "/alarmWS",
        configurator = WebSocketConfig.class
)
public class AlarmEndpoint {
//    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());
//     위는 synchro 된 인스턴스를 매핑을 해주는 것과 Lock을 걸기 위해 있는 synchronized 라면
    // Lock은 synchronized (instance)가 있고 공유하는 인스턴스를 위해서 static이 있는데
    // 왜 위의 방법을 사용하는가??

    private static Set<Session> clients = new HashSet<>();

    private HttpSession httpSession;
    @Autowired
    private Gson gson;
    @Autowired
    private AlarmService alarmService;

    @OnOpen
    public void onConnection(Session client, EndpointConfig config) {
        try {
            clients.add(client);
            this.httpSession = (HttpSession) config.getUserProperties().get("httpSession");//session 꺼내기
            log.info(String.valueOf(this.httpSession.getAttribute("acc_seq")));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @param noticeReqJson NoticeRequestDTO를 직렬화 함.
     * @param fromSession
     */
    public void OnMessage(NoticeRequestDTO noticeRequestDto, HttpSession fromSession) {
        Set<Session> clientsCopy = new HashSet<>(clients);

        Optional<String> requestUserType = Optional.ofNullable(
                noticeRequestDto.getUser_type());
        noticeRequestDto.setUser_type(requestUserType.orElse(""));

        Timestamp now = new Timestamp(System.currentTimeMillis());

        NoticeDTO notice = NoticeDTO.builder()
                .to_acc_seq(noticeRequestDto.getTo_acc_seq())
                .from_acc_seq((Integer) fromSession.getAttribute("acc_seq"))
                .notice_title(noticeRequestDto.getTitle())
                .notice_content(noticeRequestDto.getContent())
                .notice_time(now)
                .build();

        try {
            switch (noticeRequestDto.getUser_type()) {
                case "client": {
                    // DB 저장
                    alarmService.insertNoticeOnType(notice, UserType.MEMBER);
                    // 들어와 있는 사람 알림 보내기
                    alarmService.sendTextOnType(notice, clientsCopy, UserType.MEMBER);
                    break;
                }
                case "business": {
                    // DB 저장
                    alarmService.insertNoticeOnType(notice, UserType.OWNER);
                    // 들어와 있는 사람 알림 보내기
                    alarmService.sendTextOnType(notice, clientsCopy, UserType.OWNER);
                    break;
                }
                case "admin":
                    // DB 저장
                    alarmService.insertNoticeOnType(notice, UserType.ADMIN);
                    // 들어와 있는 사람 알림 보내기
                    alarmService.sendTextOnType(notice, clientsCopy, UserType.ADMIN);
                    break;
                default: {
                    // DB 저장과 메세지 보내기를 한 번에 처리
                    for (Session client : clientsCopy) {
                        Map<String, Object> clientProperties = client.getUserProperties();

                        HttpSession hSession = (HttpSession) clientProperties.get("httpSession");
                        Integer toAccSeq = (Integer) hSession.getAttribute("acc_seq");

                        if (toAccSeq == notice.getTo_acc_seq()) {
                            String msg = alarmService.saveNotice(notice);

                            client.getBasicRemote().sendText(msg);
                            break;
                        }
                    }
                }
            }
        } catch (IOException e) { // throws Exception을 하면 for문을 다 처리하지 않고 프로그램이 종료될 위험이 있음.
            log.error(e.toString());
            throw new RuntimeException(e);
        }
    }

    @OnClose
    public void onClose(Session client) {
        clients.remove(client);
    }

    @OnError
    public void onError(Session client, Throwable throwable) {
        clients.remove(client);
    }
}
