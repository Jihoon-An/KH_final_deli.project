package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.dto.MyPageCouponDTO;
import kh.deli.domain.member.myPage.service.MyPageCouponPointService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/myPage/couponPoint")
public class MyPageCouponPointController {

    private final HttpSession session;
    private final MyPageCouponPointService myPageCouponPointService;

    @RequestMapping("")
    public String toMyPageCouponPoint(Model model) throws Exception {
        int accSeq = (int) session.getAttribute("acc_seq");
        int point = myPageCouponPointService.findMemberPointBySeq(accSeq);
        List<MyPageCouponDTO> couponList = myPageCouponPointService.findMemberCouponBySeq(accSeq);

        model.addAttribute("point", point);
        model.addAttribute("coupons", couponList);

        return "member/myPage/memberCouponPoint";
    }


}
