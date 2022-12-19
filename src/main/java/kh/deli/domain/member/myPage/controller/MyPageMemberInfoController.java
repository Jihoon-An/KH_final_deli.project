package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.service.MyPageMemberInfoService;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.MemberDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


@Controller
@AllArgsConstructor
@RequestMapping("myPage/memberInfo")
public class MyPageMemberInfoController {

    private final HttpSession session;
    private final MyPageMemberInfoService myPageMemberInfoService;


    @RequestMapping("")
    public String toMemberInfo(Model model) throws Exception {
        int accSeq = (int) session.getAttribute("acc_seq");
        AccountDTO accountDTO = myPageMemberInfoService.getAccountInfo(accSeq);
        MemberDTO memberDTO = myPageMemberInfoService.getMemberInfo(accSeq);
        model.addAttribute("accountInfo", accountDTO);
        model.addAttribute("memberInfo", memberDTO);
        return "member/myPage/memberInfo";
    }

    @ResponseBody
    @PostMapping("/modify")
    public String modify(MemberDTO memberDTO, AccountDTO accountDTO) throws Exception {
        memberDTO.setAcc_seq((int) session.getAttribute("acc_seq"));
        accountDTO.setAcc_seq((int) session.getAttribute("acc_seq"));

        System.out.println("acc SEQ : " + accountDTO.getAcc_seq());
        System.out.println("mem SEQ : " + memberDTO.getAcc_seq());
        System.out.println("mem 닉네임 : " + memberDTO.getMem_nick());
        System.out.println("acc 이메일 : " + accountDTO.getAcc_email());
        System.out.println("acc 휴대폰번호 : " + memberDTO.getMem_phone());
        myPageMemberInfoService.modifyMemberInfo(memberDTO);
        return "";
    }

    @ResponseBody
    @PostMapping("/modify/passWord")
    public String modifyPassWord(String oldPassWord, String newPassWord) throws Exception {
        int accSeq = (int) session.getAttribute("acc_seq");
        System.out.println("현재 비밀번호 : " + oldPassWord);
        System.out.println("새 비밀번호 : " + newPassWord);

        boolean result = myPageMemberInfoService.modifyAccountPW(accSeq, oldPassWord, newPassWord);
        if (result) {return "true";}else {return "false";}
    }


}
