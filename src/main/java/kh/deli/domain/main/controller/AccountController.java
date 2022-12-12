package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.AccountService;
import kh.deli.global.entity.AccountDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("/account/")
public class AccountController {

    private final AccountService accountService;
    private final HttpSession session;

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
        return "redirect:/";
    }

    @RequestMapping("oauth/kakao")
    public String  kakaoLogin(String code) throws Exception {
        System.out.println(code);
        accountService.getKakaoAccessToken(code);

        // 발급 받은 accessToken 으로 카카오 회원 정보 DB 저장
        String User = accountService.saveKakaoToken();

        System.out.println("로그인 성공! 저장은 아직!");
        return "redirect:/";
    }

//    // 프론트에서 인가코드 받아오는 url
//    @GetMapping("/oauth/token")
//    public String getLogin(String code) {
//
//        // 넘어온 인가 코드를 통해 access_token 발급
//        OauthToken oauthToken = userService.getAccessToken(code);
//
//        //(1)
//        // 발급 받은 accessToken 으로 카카오 회원 정보 DB 저장
//        String User = userService.saveUser(oauthToken.getAccess_token());
//
//        return User;
//    }

    @RequestMapping("oauth/kakaoLogout")
    public String  kakaoLogout() throws Exception {
        return "redirect:/";
    }



}

