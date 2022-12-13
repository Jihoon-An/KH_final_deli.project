package kh.deli.domain.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String toHome(@CookieValue(value = "saved_email", required = false) String saved_email, Model model) throws Exception {
        // @CookieValue 를 통해 쿠키 값 불러와 String 에 담기
        // required = false 안 하면 NullPointException
        model.addAttribute("saved_email", saved_email);
        return "main/home";
    }
}
