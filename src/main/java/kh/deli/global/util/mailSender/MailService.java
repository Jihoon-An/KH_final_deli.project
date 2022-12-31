package kh.deli.global.util.mailSender;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;

@Service
@AllArgsConstructor
public class MailService {

    @Value("${spring.mail.username}")
    private final String FROM_ADDRESS;

    private final MailHandler mailHandler;

    public void mailSend(MailDTO mailDto) throws MessagingException {

        mailHandler.setFrom(FROM_ADDRESS);
        mailHandler.setTo(mailDto.getAddress());
        mailHandler.setSubject(mailDto.getTitle());
        mailHandler.setText(mailDto.getMessage(), true);
        mailHandler.send();
    }
}
