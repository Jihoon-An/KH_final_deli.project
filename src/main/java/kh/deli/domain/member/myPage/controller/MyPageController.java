package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.service.MyPageMemberInfoService;
import kh.deli.global.entity.MemberDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("/myPage")
public class MyPageController {

    private final HttpSession session;
    private final MyPageMemberInfoService myPageMemberInfoService;

    @RequestMapping("")
    public String toMyPage(Model model) throws Exception {
        int accSeq = (int) session.getAttribute("acc_seq");
        MemberDTO memberDTO = myPageMemberInfoService.getMemberInfo(accSeq);
        model.addAttribute("memberInfo", memberDTO);

        return "/member/myPage/myPage";
    }






}
