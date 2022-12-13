package kh.deli.global.util.mailSender;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class MailService {
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    MailHandler mailHandler;
    private static final String FROM_ADDRESS = "abg1418@gmail.com";

    public void mailSend(MailDTO mailDto) throws MessagingException {
        mailHandler.setFrom(FROM_ADDRESS);
        mailHandler.setTo(mailDto.getAddress());
        mailHandler.setSubject(mailDto.getTitle());
        mailHandler.setText(mailDto.getMessage(), true);
        mailHandler.send();
    }
}
