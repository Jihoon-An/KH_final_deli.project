package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.dto.MypageReviewDTO;
import kh.deli.domain.member.myPage.service.MyPageReviewService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/myPage/reviewList")
@AllArgsConstructor
public class MypageReviewListController {

    private final MyPageReviewService myPageReviewService;

    private final HttpSession session;

    @RequestMapping("")
    @ResponseBody
    public String selectAllRivewList() throws Exception{
        int acc_seq = 49; // 회원정보를 기준으로 리뷰 출력
        MypageReviewDTO dto = (MypageReviewDTO) myPageReviewService.getReviews();
        return "redirect:/";
    }


}
