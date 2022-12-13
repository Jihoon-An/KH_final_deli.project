package kh.deli.domain.member.userMenu.controller;

import kh.deli.domain.main.dto.MemberMainRequestDTO;
import kh.deli.domain.member.userMenu.service.MemberReviewFormService;
import kh.deli.global.entity.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/memberReviewForm/")
public class MemberReviewFormController {

    @Autowired
    private MemberReviewFormService memberReviewFormService;

    @RequestMapping("toMemberReviewForm")
    public String toMemberMain(Model model) throws Exception {
        //주문내역 가져오기
        return "member/userMenu/memberReviewForm";
    }

    @RequestMapping(value="reviewInsert",method = RequestMethod.POST)
    public String reviewInsert(ReviewDTO dto) throws Exception{
        System.out.println(dto.getRev_content());
        memberReviewFormService.reviewInsert(dto);
        return "redirect:/";
    }
}
