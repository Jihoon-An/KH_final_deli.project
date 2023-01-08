package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.MainAccountService;
import kh.deli.domain.main.service.MainMemberCouponService;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.MemberDTO;
import kh.deli.global.util.RedisUtil;
import kh.deli.global.util.alarm.AlarmEndpoint;
import kh.deli.global.util.alarm.NoticeRequestDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/account/")
public class AccountController {

    private final MainAccountService mainAccountService;
    private final MainMemberCouponService mcpService;
    private final HttpSession session;
    private final RedisUtil redisUtil;

    private final AlarmEndpoint alarmEndpoint;


    /**
     * <h1>Normal Type 회원 로그인</h1>
     * @param emailSave
     * @return set loginEmail in Session & set saved_email in Cookie
     */
    @ResponseBody
    @PostMapping("login")
    public Boolean login(String email, String pw, String emailSave, HttpServletResponse response)
            throws Exception
    {
        // 로그인 서비스 요청
        int result = mainAccountService.login(email, pw);

        if (result == 1) { // 로그인 성공했을 때

            // Session 에 로그인 성공한 이메일 담기
            session.setAttribute("loginEmail", email);
            session.setAttribute("loginType", "normal");
            session.setAttribute("acc_seq", mainAccountService.getAccSeq(email));

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
            return true;
        }
        return false;
    }

    @RequestMapping("logout")
    public String logout() throws Exception {
        String loginType = (String)session.getAttribute("loginType");
        switch (loginType) {
            case "normal" :
                session.invalidate();
                break;
            case "kakao" :
                return "redirect:https://kauth.kakao.com/oauth/logout?client_id=1475b617eab69841d5cabd68f1527015&logout_redirect_uri=http://localhost/account/oauth/kakaoLogout";
                }
        return "redirect:/";
    }

    @PostMapping("withdrawal")
    public String withdrawal() throws Exception {
        System.out.println("aaaaaaaa");
        int accSeq = (Integer) session.getAttribute("acc_seq");
        String loginType = (String)session.getAttribute("loginType");
        System.out.println(accSeq);
        System.out.println(loginType);
        switch (loginType) {
            case "normal" :
                mainAccountService.withdrawal(accSeq); // ADDRESS > MEMBER > ACCOUNT 순 데이터 삭제
                session.invalidate();
                break;
            case "kakao" :
                String accessToken = (String)session.getAttribute("kakaoAccessToken");
                mainAccountService.kakaoUnlink(accessToken); // 카카오 연결해제
                mainAccountService.withdrawal(accSeq); // ADDRESS > MEMBER > ACCOUNT 순 데이터 삭제
                session.invalidate();
                break;
//                return "redirect:https://kauth.kakao.com/oauth/logout?client_id=1475b617eab69841d5cabd68f1527015&logout_redirect_uri=http://localhost/account/oauth/kakaoLogout";
        }
        return "redirect:/";

    }

    @RequestMapping("kakaoUnLink")
    public String kakaoUnLink() throws Exception {
        String accessToken = (String)session.getAttribute("kakaoAccessToken");
        mainAccountService.kakaoUnlink(accessToken);
        session.invalidate();
        return "redirect:/";
    }

    @ResponseBody
    @RequestMapping("deleteSavedEmail")
    public String deleteSavedEmail(HttpServletResponse response) throws Exception {
        Cookie cookie = new Cookie("saved_email", null);
        cookie.setMaxAge(0); // 유통기한 0초 ( 삭제 )
        cookie.setPath("/");
        response.addCookie(cookie);
        return "";
    }

    @RequestMapping("signup")
    public String toMemberSignUp(@RequestParam(value = "kakaoId", required = false)String kakaoId, Model model) throws Exception {
        System.out.println("회원가입시작..");
        log.info("kakaoId : " + kakaoId);
        model.addAttribute("acc_token", kakaoId);
        return "main/memberSignUp";
    }

    @PostMapping("memberSignUp")
    public String memberSignUp(AccountDTO accountDTO, MemberDTO memberDTO, AddressDTO addressDTO) throws Exception {
        mainAccountService.memberSignUp(accountDTO,memberDTO,addressDTO);
        Integer accSeq = mainAccountService.getAccSeq(accountDTO.getAcc_email());

        session.setAttribute("loginEmail", accountDTO.getAcc_email());
        session.setAttribute("loginType", "normal");
        session.setAttribute("acc_seq", accSeq);

        mcpService.giveSignUpCp(accSeq);

        redisUtil.deleteData(memberDTO.getMem_phone());

        NoticeRequestDTO noticeRequestDTO = NoticeRequestDTO.builder()
                .toAccSeq(accSeq)
                .title(memberDTO.getMem_name() + "님 회원가입을 축하드립니다.")
                .content("")
                .build();
        alarmEndpoint.OnMessage(noticeRequestDTO, session);

        return "redirect:/";
    }

    @PostMapping("kakaoSignUp")
    public String kakaoSignUp(AccountDTO accountDTO,MemberDTO memberDTO,AddressDTO addressDTO) throws Exception {
        mainAccountService.kakaoSignUp(accountDTO,memberDTO,addressDTO);
        Integer accSeq = mainAccountService.getAccSeq(accountDTO.getAcc_email());

        session.setAttribute("loginEmail", accountDTO.getAcc_email());
        session.setAttribute("loginType", "kakao");
        session.setAttribute("acc_seq",  accSeq);
        mcpService.giveSignUpCp(accSeq);
        redisUtil.deleteData(memberDTO.getMem_phone());

        NoticeRequestDTO noticeRequestDTO = NoticeRequestDTO.builder()
                .toAccSeq(accSeq)
                .title(memberDTO.getMem_name() + "님 회원가입을 축하드립니다.")
                .content("")
                .build();
        alarmEndpoint.OnMessage(noticeRequestDTO, session);

        return "redirect:/";
    }

    @RequestMapping("oauth/kakao")
    public String  kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
        log.info("code = " + code);
        // 코드를 이용하여 accessToken 추출
        String accessToken = mainAccountService.getKakaoAccessToken(code);
        log.info("accessToken = " + accessToken);
        // 세션 토큰 담기
        session.setAttribute("kakaoAccessToken", accessToken);
        // accessToken을 이용하여 사용자 정보 추출
        String kakaoId = mainAccountService.getKakaoId(accessToken);
        log.info("kakaoId = " + kakaoId);
        // kakaoId 으로 카카오 회원 정보 DB 저장
        if(!mainAccountService.dupleCheckKakaoId(kakaoId)){
            // 회원가입으로 페이지 이동
            return "redirect:/account/signup?kakaoId=" + kakaoId;
        } else {
            // 저장된 회원 정보가 있으면 회원가입 된게 맞아서 그냥 페이지 메인으로
            String email = mainAccountService.getAccEmail(kakaoId);
            log.info("email = " + email);
            session.setAttribute("loginEmail", email);
            session.setAttribute("loginType", "kakao");
            session.setAttribute("acc_seq", mainAccountService.getAccSeq(email));
            return "redirect:/";
        }
    }

    @RequestMapping("oauth/kakaoLogout")
    public String  kakaoLogout() throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    @ResponseBody
    @RequestMapping(value="certify/tel", method=RequestMethod.POST)
    public String telCertify(String mem_phone) {
        String serverTelCertifyStr = mainAccountService.sendRandomMessage(mem_phone);
        redisUtil.setData(mem_phone,serverTelCertifyStr,180); // 문자 인증번호 정보를 Redis에 저장
        return serverTelCertifyStr;
    }

    @ResponseBody
    @RequestMapping(value="certify/telConfirm", method=RequestMethod.POST)
    public boolean telConfirm(String mem_phone, String phone_confirm_input) {
        String getServerTelCertifyStr = redisUtil.getData(mem_phone);
        return phone_confirm_input.equals(getServerTelCertifyStr) ? true : false;
    }

    @PostMapping("/dupleCheck")
    @ResponseBody
    public boolean dupleCheck(String email) throws Exception {
        return mainAccountService.dupleCheck(email);
    }


    @RequestMapping("/findAccount")
    public String toFindAccountPage() throws Exception {
        return "main/findAccount";
    }

    @ResponseBody
    @PostMapping("/findAccount/email")
    public List<AccountDTO> findEmail(String phoneNumber) throws Exception {
        System.out.println(phoneNumber);
        List<AccountDTO> accountDTOList = mainAccountService.findAccountByPhoneNumber(phoneNumber);
        return accountDTOList;
    }

    @ResponseBody
    @PostMapping("/findAccount/passWord")
    public String findPassWord(String email, String phoneNumber) throws Exception {
        Integer accSeq = mainAccountService.findPassWordByPhoneNumber(email, phoneNumber);
        return mainAccountService.modifyPassWordWithRandomCodeBySeq(accSeq);
    }
}

