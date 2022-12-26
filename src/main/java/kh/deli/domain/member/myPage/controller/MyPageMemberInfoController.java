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
    public String modify(String mem_nick, String mem_phone) throws Exception {
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMem_nick(mem_nick);
        memberDTO.setMem_phone(mem_phone);
        memberDTO.setAcc_seq((int) session.getAttribute("acc_seq"));

        myPageMemberInfoService.modifyMemberInfo(memberDTO);
        return "";
    }

    @ResponseBody
    @PostMapping("/modify/passWord")
    public String modifyPassWord(String oldPassWord, String newPassWord) throws Exception {
        int accSeq = (int) session.getAttribute("acc_seq");
        boolean result = myPageMemberInfoService.modifyAccountPW(accSeq, oldPassWord, newPassWord);
        if (result) {return "true";}else {return "false";}
    }


}
