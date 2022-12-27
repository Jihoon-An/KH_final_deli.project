package kh.deli.domain.member.store.controller;
import ch.qos.logback.core.net.SyslogOutputStream;
import kh.deli.domain.member.myPage.service.MyPageDibsService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import kh.deli.domain.member.store.service.StoreReviewService;
import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.domain.owner.service.OwnerOwnerService;
import kh.deli.global.entity.OwnerDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/store/info/")
@AllArgsConstructor
public class StoreInfoController {

    private final StoreStoreService storeStoreService;
    private final OwnerOwnerService ownerOwnerService;
    private final StoreReviewService storeReviewService;

    private final HttpSession session;
    private final MyPageDibsService myPageDibsService;

    @RequestMapping("{storeSeq}")
    public String toStoreInfo(Model model,@PathVariable("storeSeq") Integer store_seq) throws Exception{

//        int store_seq=19; //가게상세메뉴에서 seq

        StoreDTO storeInfoDTO=storeStoreService.getStoreInfo(store_seq); // 식당정보
        OwnerDTO ownerInfoDTO=ownerOwnerService.getBsInfo(store_seq); // 사업자정보
        int storeReviewCount = storeReviewService.getReviewCount(store_seq); // 식당리뷰개수
        double storeReviewAvg=storeReviewService.getReviewAvg(store_seq);// 식당별점평균

        //영업시간 파싱
        JSONParser jsonParser = new JSONParser();
        JSONObject bsnsHours=(JSONObject) jsonParser.parse(storeInfoDTO.getStore_bsns_hours());

        int acc_seq = (Integer) session.getAttribute("acc_seq"); //찜
        int result= myPageDibsService.isExistDibs(acc_seq,store_seq);

        model.addAttribute("storeInfoDTO",storeInfoDTO);
        model.addAttribute("ownerInfoDTO",ownerInfoDTO);
        model.addAttribute("storeReviewCount",storeReviewCount);
        model.addAttribute("storeReviewAvg",storeReviewAvg);
        model.addAttribute("bsnsHours",bsnsHours);
        model.addAttribute("result",result);
        return "/member/store/storeInfo";
    }

}
