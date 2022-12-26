package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.MainAccountService;
import kh.deli.domain.main.service.MainOwnerService;
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
    private final MainAccountService mainAccountService;
    private final MainOwnerService ownerSignUpService;

    @RequestMapping("")
    public String toOwnerSignUp() {
        return "main/ownerSignUp";
    }

    @PostMapping("/signUp")
    public String signUp(OwnerDTO owner, AccountDTO account, MultipartFile file) throws Exception{

        //signUp 데이터 처리
        ownerSignUpService.signUp(owner, account, file);

        session.setAttribute("loginEmail", account.getAcc_email());
        session.setAttribute("loginType", "normal");
        session.setAttribute("acc_seq", mainAccountService.getAccSeq(account.getAcc_email()));

        return "redirect:/";
    }

    @PostMapping("/dupleCheck")
    @ResponseBody
    public boolean dupleCheck(String email) throws Exception {
        return mainAccountService.dupleCheck(email);
    }
}
