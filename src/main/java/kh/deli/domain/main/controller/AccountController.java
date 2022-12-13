package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.AccountService;
import kh.deli.global.entity.AccountDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("/account/")
public class AccountController {

    private final AccountService accountService;
    private final HttpSession session;

    /**
     * <h1>Normal Type 회원 로그인</h1>
     * @param email
     * @param pw
     * @param emailSave
     * @param response
     * @return set loginEmail to Session & set saved_email to Cookie
     * @throws Exception
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(String email, String pw, String emailSave, HttpServletResponse response) throws Exception {
        // 로그인 서비스 요청
        int result = accountService.login(email, pw);

        if (result == 1) { // 로그인 성공했을 때

            // Session 에 로그인 성공한 이메일 담기
            session.setAttribute("loginEmail", email);

            // String.valueOf 사용하지 않으면 NullPointException
            // String.valueOf 없이 사용하려면 true false 등으로 값 변환 후 조건문 작성
            if (String.valueOf(emailSave).equals("on")) { // [이메일 기억하기] 체크 되었을 때
                // "saved_email"이라는 쿠키명에 email 담기
                Cookie cookie = new Cookie("saved_email", email);
                cookie.setMaxAge(60 * 60 * 24 * 14); // 유통기한 14일 (초 단위)
                cookie.setPath("/"); // 모든 경로에서 사용하겠다 선언
                response.addCookie(cookie); // response 에 쿠키 생성
            } else{ // [이메일 기억하기] 체크 안 되었을 때
                Cookie cookie = new Cookie("saved_email", null);
                cookie.setMaxAge(0); // 유통기한 0초 ( 삭제 )
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

