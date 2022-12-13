package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.AccountService;
import kh.deli.global.entity.AccountDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account/")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private HttpSession session;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(String email, String pw) throws Exception {
        System.out.println(email + " : " + pw);
        int result = accountService.login(email, pw);
        if (result == 1) {
            session.setAttribute("loginEmail", email);
        }
        return "redirect:/";
    }

    @RequestMapping("logout")
    public String logout() throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("toMemberSignUp")
    public String toMemberSignUp() throws Exception {
        return "main/memberSignUp";
    }

    @PostMapping("memberSignUp")
    public String memberSignUp(AccountDTO accountDTO) throws Exception {
        accountService.memberSignUp(accountDTO);
        session.setAttribute("loginEmail", accountDTO.getAcc_email());
        return "redirect:/";
    }

    @PostMapping("kakaoSignUp")
    public String kakaoSignUp(AccountDTO accountDTO, String kakaoId) throws Exception {
        accountDTO.setAcc_token(kakaoId);
        accountService.kakaoSignUp(accountDTO);
        accountService.memberSignUp(accountDTO);
        session.setAttribute("loginEmail", accountDTO.getAcc_email());
        return "redirect:/";
    }

    @RequestMapping("oauth/kakao")
    public String  kakaoLogin(String code) throws Exception {
        // 코드를 이용하여 accessToken 추출
        String accessToken = accountService.getKakaoAccessToken(code);
        // accessToken을 이용하여 사용자 정보 추출
        String kakaoId = accountService.getKakaoId(accessToken);
        System.out.println("로그인 성공! 저장은 아직!");
        // kakaoId 으로 카카오 회원 정보 DB 저장
        if(!accountService.dupleCheckKakaoId(kakaoId)){
            System.out.println("로그인 성공! 저장은 함!");
            // 회원가입으로 페이지 이동
            return "/account/toMemberSignUp?kakaoId=" + kakaoId;
        } else {
            // 저장된 회원 정보가 있으면 그냥 페이지 메인으로
            return "redirect:/";
        }
    }

    @RequestMapping("oauth/kakaoLogout")
    public String  kakaoLogout() throws Exception {
        return "redirect:/";
    }


}

