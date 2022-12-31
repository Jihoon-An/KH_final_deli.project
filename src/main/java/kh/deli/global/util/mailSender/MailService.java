package kh.deli.global.util.mailSender;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;

@Service
@AllArgsConstructor
public class MailService {

    private static final String FROM_ADDRESS = "deli.kh.project@gmail.com";

    private final MailHandler mailHandler;

    public void mailSend(MailDTO mailDto) throws MessagingException {

        mailHandler.setFrom(FROM_ADDRESS);
        mailHandler.setTo(mailDto.getAddress());
        mailHandler.setSubject(mailDto.getTitle());
        mailHandler.setText(mailDto.getMessage(), true);
        mailHandler.send();
    }
}
