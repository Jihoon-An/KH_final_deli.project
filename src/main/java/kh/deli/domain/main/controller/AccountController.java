package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.AccountService;
import kh.deli.global.entity.AccountDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;
    @RequestMapping("/toMemberSignUp")
    public String toMemberSignUp() throws Exception {
        return "main/memberSignUp";
    }
    @PostMapping("/memberSignUp")
    public String memberSignUp(AccountDTO accountDTO) throws Exception {
        accountService.memberSignUp(accountDTO);
        return "main/home";
    }

}
