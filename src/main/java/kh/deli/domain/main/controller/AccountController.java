package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account/")
public class AccountController {

    @Autowired
    private AccountService service;

    @Autowired
    private HttpSession session;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(String email, String pw) throws Exception {
        int result = service.login(email, pw);
        if (result == 1) {
            session.setAttribute("loginEmail", email);
        }
        return "redirect:/";
    }

    @RequestMapping("signUp")
    public String signUp() {
        return "main/home";
    }

}
