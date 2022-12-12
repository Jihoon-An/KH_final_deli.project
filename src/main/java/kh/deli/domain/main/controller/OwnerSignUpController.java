package kh.deli.domain.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OwnerSignUpController {
    @RequestMapping("/ownerSignUp")
    public String toOwnerSignUp() {
        return "main/ownerSignUp";
    }
}
