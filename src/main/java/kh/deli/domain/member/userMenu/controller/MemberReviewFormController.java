package kh.deli.domain.member.userMenu.controller;

import kh.deli.domain.main.dto.MemberMainRequestDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/memberReviewForm/")
public class MemberReviewFormController {

//    @Autowired
//    private ;

    @RequestMapping("toMemberReviewForm")
    public String toMemberMain(Model model) throws Exception {
        return "member/userMenu/memberReviewForm";
    }
}
