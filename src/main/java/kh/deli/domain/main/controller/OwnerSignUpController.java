package kh.deli.domain.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ownerSignUp")
public class OwnerSignUpController {

    @Autowired
    HttpSession session;

    @RequestMapping("/")
    public String toOwnerSignUp() {
        return "main/ownerSignUp";
    }

    @PostMapping("/signUp")
    public String signUp() {
        return "redirect:/";
    }
}
