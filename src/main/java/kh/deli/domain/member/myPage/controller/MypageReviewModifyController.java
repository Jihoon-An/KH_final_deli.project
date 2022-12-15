package kh.deli.domain.member.myPage.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import kh.deli.domain.member.myPage.service.MemberReviewService;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage/review/")

public class MypageReviewModifyController {

    @Autowired
    private MemberReviewService memberReviewService;

    @RequestMapping()
    public String toModifyReviewForm(Model model) throws Exception {
        int order_seq = 1;
        int rev_seq = 7;
        int store_seq = 1;
        OrdersDTO orders_dto = memberReviewService.selectByOrderSeq(order_seq);
        ReviewDTO review_dto = memberReviewService.selectByReviewSeq(rev_seq);
//        List<FormedReviewDTO>formedReviewDTOList=review_dto.getRev_sysname();

//        JsonArray jsonArray = new JsonArray(review_dto.getRev_sysname());

        StoreDTO store_dto = memberReviewService.selectByStoreSeq(store_seq);
        model.addAttribute("orders_dto", orders_dto);
        model.addAttribute("review_dto", review_dto);
        model.addAttribute("store_dto", store_dto);
        return "/member/myPage/modifyReview";
    }

//    @RequestMapping("modifyReview")
//    public String modifyReview(ReviewDTO dto) throws Exception{
//        int rev_seq=1;
//        dto.setRev_seq(rev_seq);
//        memberReviewModifyService.updateReview(dto);
//        return "redirect:";
//    }

}
