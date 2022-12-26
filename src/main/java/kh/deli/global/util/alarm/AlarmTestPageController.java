package kh.deli.global.util.alarm;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("alarmTestPage")
public class AlarmTestPageController {
    private final HttpSession session;

    @RequestMapping("")
    public String toTestPage() {
        session.setAttribute("acc_seq", 83);

        return "global/alarmTestPage";
    }
}
