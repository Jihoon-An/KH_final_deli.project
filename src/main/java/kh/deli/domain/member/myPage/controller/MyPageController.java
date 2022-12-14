package kh.deli.domain.member.myPage.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("/userMenu/")
public class MyPageController {

    @RequestMapping("toMyPage")
    public String toMyPage() throws Exception {
        return "/member/userMenu/myPage";
    }






}
