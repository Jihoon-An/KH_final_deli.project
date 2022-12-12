package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.AccountService;
import kh.deli.global.entity.AccountDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account/")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private HttpSession session;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(String email, String pw, String emailSave, HttpServletResponse response) throws Exception {

        int result = accountService.login(email, pw);
        if (result == 1) {
            session.setAttribute("loginEmail", email);
            if (String.valueOf(emailSave).equals("on")) {
                Cookie cookie = new Cookie("saved_email", email);
                cookie.setMaxAge(24 * 30 * 60 * 60 * 1000); // 유통기한 30일
                cookie.setPath("/");
                response.addCookie(cookie);
            } else{
                Cookie cookie = new Cookie("saved_email", null);
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
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
        return "redirect:/";
    }

    @RequestMapping("oauth/kakao")
    public String  kakaoLogin(String code) throws Exception {
        System.out.println(code);

        // 코드를 이용하여 accessToken 추출
        String accessToken = accountService.getKakaoAccessToken(code);

        // accessToken을 이용하여 사용자 정보 추출
        accountService.getKakaoId(accessToken);

        // 발급 받은 accessToken 으로 카카오 회원 정보 DB 저장
        // String User = accountService.saveKakaoToken();

        System.out.println("로그인 성공! 저장은 아직!");
        return "redirect:/";
    }

    @RequestMapping("oauth/kakaoLogout")
    public String  kakaoLogout() throws Exception {
        return "redirect:/";
    }


}

