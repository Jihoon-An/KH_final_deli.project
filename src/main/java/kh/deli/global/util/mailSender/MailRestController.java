package kh.deli.global.util.mailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailRestController {
    @Autowired
    MailService mailService;
    @PostMapping("/mailCerti")
    public void mailCerti(MailDTO mail) {
        mailService.mailSend(mail);
    }
}
