package kh.deli.global.util.alarm;

import kh.deli.global.config.WebSocketConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
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

    @OnOpen
    public void onConnection(Session client, EndpointConfig config) {
        try {
            clients.add(client);
            this.httpSession = (HttpSession) config.getUserProperties().get("httpSession");//session 꺼내기
            log.info(String.valueOf(this.httpSession.getAttribute("login")));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @OnMessage
    public void OnMessage(String noticeReqJson) {

        Set<Session> clientsCopy = new HashSet<>(clients);

        for (Session client : clientsCopy) {
            try {
                Map<String, Object> clientProperties = client.getUserProperties();

                HttpSession hSession = (HttpSession) clientProperties.get("httpSession");

                if (1 == (Long) hSession.getAttribute("login")) {
                    client.getBasicRemote().sendText(msg);
                }
            } catch (IOException e) { // throws Exception을 하면 for문을 다 처리하지 않고 프로그램이 종료될 위험이 있음.
                log.error(e.toString());
                throw new RuntimeException(e);
            }
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
