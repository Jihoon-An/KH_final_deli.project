package kh.deli.domain.member.store.controller;


import kh.deli.domain.member.store.service.StoreReviewService;
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
    private final StoreReviewService storeReviewService;

    @RequestMapping()
    public String storeInfo(Model model) throws Exception{

        int store_seq=19;

        StoreDTO storeInfoDTO=storeStoreService.storeInfo(store_seq); //식당정보
        OwnerDTO ownerInfoDTO=ownerOwnerService.bsInfo(store_seq); //사업자정보
        int storeReviewCount = storeReviewService.getReviewCount(store_seq); //식당리뷰개수
        double storeReviewAvg=storeReviewService.getReviewAvg(store_seq);//식당별점평균
        model.addAttribute("storeInfoDTO",storeInfoDTO);
        model.addAttribute("ownerInfoDTO",ownerInfoDTO);
        model.addAttribute("storeReviewCount",storeReviewCount);
        model.addAttribute("storeReviewAvg",storeReviewAvg);


        return "/member/store/storeInfo";
    }

}
