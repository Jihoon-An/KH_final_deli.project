package kh.deli.global.util.alarm;

import kh.deli.global.entity.NoticeDTO;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("alarm")
public class AlarmController {
    private final AlarmEndpoint alarmEndpoint;
    private final AlarmService alarmService;

    private final HttpSession session;

    @PostMapping("send")
    public void sendMessage(@RequestBody NoticeRequestDTO noticeRequestDto) {
        alarmEndpoint.OnMessage(noticeRequestDto, session);
    }

    @PostMapping("delete")
    public void delete(@RequestBody Integer seq) {
        alarmService.delete(seq);
    }

    @PostMapping("getList")
    public List<NoticeDTO> getNoticeList() {
        return alarmService.findNoticeByToSeq(
                (Integer) session.getAttribute("acc_seq"));
    }

}
