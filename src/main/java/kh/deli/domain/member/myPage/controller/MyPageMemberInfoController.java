package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.service.MyPageMemberInfoService;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.MemberDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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



}
