package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.AccountService;
import kh.deli.domain.main.service.OwnerSignUpService;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.OwnerDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("/ownerSignUp")
public class OwnerSignUpController {

    private final HttpSession session;
    private final AccountService accountService;
    private final OwnerSignUpService ownerSignUpService;

    @RequestMapping("")
    public String toOwnerSignUp() {
        return "main/ownerSignUp";
    }

    @PostMapping("/signUp")
    public String signUp(OwnerDTO owner, AccountDTO account, MultipartFile file) throws Exception{

        ownerSignUpService.signUp(owner, account);

        return "redirect:/";
    }

    @PostMapping("/dupleCheck")
    @ResponseBody
    public boolean dupleCheck(String email) throws Exception {
        return accountService.dupleCheck(email);
    }
}
