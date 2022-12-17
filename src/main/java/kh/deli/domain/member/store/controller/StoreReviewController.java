package kh.deli.domain.member.store.controller;

import kh.deli.domain.member.myPage.dto.MyPageReviewDTO;
import kh.deli.domain.member.myPage.service.MemberReviewService;
import kh.deli.domain.member.store.mapper.StoreStoreMapper;
import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.global.entity.MemberDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/store/review")
public class StoreReviewController {

    private final StoreStoreService storeStoreService;
    private final MemberReviewService memberReviewService;

    @RequestMapping()
    public String toStoreReview(Model model) throws Exception{
        int store_seq=16;
        int acc_seq=9; //사업자 acc_seq
        StoreDTO storeInfoDTO=storeStoreService.storeInfo(store_seq);
        MemberDTO memberDTO =

        int storeReviewCount = memberReviewService.getReviewCount(store_seq);
        double storeReviewAvg=memberReviewService.getReviewAvg(store_seq);
//        List<MyPageReviewDTO> myPageReviewList=memberReviewService.getReviews();
        model.addAttribute("storeInfoDTO",storeInfoDTO);
        model.addAttribute("storeReviewCount",storeReviewCount);
        model.addAttribute("storeReviewAvg",storeReviewAvg);
//        model.addAttribute("myPageReviewList",myPageReviewList);
        return "/member/store/storeReview";
    }
}
