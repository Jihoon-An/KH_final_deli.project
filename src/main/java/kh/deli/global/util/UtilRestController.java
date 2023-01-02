package kh.deli.global.util;

import kh.deli.global.util.naverSensV2.NaverNShortURL;
import kh.deli.global.util.naverSensV2.NaverSms;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/util/")
public class UtilRestController {
    private final NaverSms smsService;

    /**
     * 전화번호로 sms메세지 보내기
     * @param tel 전화번호
     * @param msg 보낼 메세지
     */
    @PostMapping("sendSms")
    public String sendSms(String tel, String msg) {
        smsService.send_msg(tel, msg);
        return "";
    }
    @PostMapping("sendRiderLink")
    public String sendRiderLink(String tel, String msg) {
        NaverNShortURL shortURL = new NaverNShortURL();
        shortURL.toShortURL(msg);
        smsService.send_msg(tel,"딜리 라이더 링크\n" + msg);
        return "";
    }
}
