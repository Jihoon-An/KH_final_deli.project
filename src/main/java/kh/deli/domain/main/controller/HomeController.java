package kh.deli.domain.main.controller;

import kh.deli.domain.main.dto.MemberMainRequestDTO;
import kh.deli.domain.main.service.MemberMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private HttpSession session;

    @Autowired
    private MemberMainService memberMainService;

    @RequestMapping("/")
    public String toHome(@CookieValue(value = "saved_email", required = false) String saved_email, Model model) throws Exception {
        // @CookieValue 를 통해 쿠키 값 불러와 String 에 담기
        // required = false 안 하면 NullPointException

        if (session.getAttribute("acc_seq")!=null) {
            int acc_seq = (Integer) session.getAttribute("acc_seq");
            String acc_type = memberMainService.selectType(acc_seq);

            if (acc_type.equals("client")) {
                List<MemberMainRequestDTO> list = memberMainService.selectByStar();
                model.addAttribute("list", list);
                return "main/memberMain";
            }
        }

        model.addAttribute("saved_email", saved_email);
        return "main/home";
    }


}
