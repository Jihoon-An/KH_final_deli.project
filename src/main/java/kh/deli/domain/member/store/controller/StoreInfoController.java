package kh.deli.domain.member.store.controller;

import kh.deli.domain.member.myPage.service.MemberReviewService;
import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.domain.owner.service.OwnerOwnerService;
import kh.deli.global.entity.OwnerDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store/info")
@AllArgsConstructor
public class StoreInfoController {

    private final StoreStoreService storeStoreService;
    private final OwnerOwnerService ownerOwnerService;
    private final MemberReviewService memberReviewService;

    @RequestMapping()
    public String storeInfo(Model model) throws Exception{
        int store_seq=16;
        int acc_seq=9; //사업자 acc_seq
        StoreDTO storeInfoDTO=storeStoreService.storeInfo(store_seq);
        OwnerDTO ownerInfoDTO=ownerOwnerService.bsInfo(acc_seq);
        int storeReviewCount = memberReviewService.getReviewCount(store_seq);
        double storeReviewAvg=memberReviewService.getReviewAvg(store_seq);
        model.addAttribute("storeInfoDTO",storeInfoDTO);
        model.addAttribute("ownerInfoDTO",ownerInfoDTO);
        model.addAttribute("storeReviewCount",storeReviewCount);
        model.addAttribute("storeReviewAvg",storeReviewAvg);
        return "/member/store/storeInfo";
    }
//    select owner.* from owner,store where owner.acc_seq=store.owner_seq

}
