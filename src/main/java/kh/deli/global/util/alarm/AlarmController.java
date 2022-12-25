package kh.deli.global.util.alarm;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("alarm")
public class AlarmController {
    private final AlarmEndpoint alarmEndpoint;

    private final HttpSession session;
    private static Long count = 1L;

    @RequestMapping("")
    public String toTestPage() {
        session.setAttribute("login", this.count++);

        return "global/alarmTestPage";
    }

    @RequestMapping("send")
    @ResponseBody
    public void sendMessage(String noticeReqJson) {
        alarmEndpoint.OnMessage(noticeReqJson);
    }
}
