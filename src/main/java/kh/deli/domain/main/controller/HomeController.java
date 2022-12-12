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
            model.addAttribute("saved_email", saved_email);
        return "main/home";
    }
}
