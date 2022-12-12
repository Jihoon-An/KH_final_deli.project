package kh.deli.domain.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {

    @RequestMapping("signUp")
    public String signUp() {
        return "main/home";
    }

}
