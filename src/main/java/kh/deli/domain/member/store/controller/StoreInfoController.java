package kh.deli.domain.member.store.controller;
import ch.qos.logback.core.net.SyslogOutputStream;
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
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/store/info")
@AllArgsConstructor
public class StoreInfoController {

    private final StoreStoreService storeStoreService;
    private final OwnerOwnerService ownerOwnerService;
    private final StoreReviewService storeReviewService;

    @RequestMapping()
    public String toStoreInfo(Model model) throws Exception{

        int store_seq=21; //가게상세메뉴에서 seq

        StoreDTO storeInfoDTO=storeStoreService.getStoreInfo(store_seq); // 식당정보
        OwnerDTO ownerInfoDTO=ownerOwnerService.getBsInfo(store_seq); // 사업자정보
        int storeReviewCount = storeReviewService.getReviewCount(store_seq); // 식당리뷰개수
        double storeReviewAvg=storeReviewService.getReviewAvg(store_seq);// 식당별점평균

        //영업시간 파싱
        JSONParser jsonParser = new JSONParser();
        JSONObject bsnsHours=(JSONObject) jsonParser.parse(storeInfoDTO.getStore_bsns_hours());

        model.addAttribute("storeInfoDTO",storeInfoDTO);
        model.addAttribute("ownerInfoDTO",ownerInfoDTO);
        model.addAttribute("storeReviewCount",storeReviewCount);
        model.addAttribute("storeReviewAvg",storeReviewAvg);
        model.addAttribute("bsnsHours",bsnsHours);
        return "/member/store/storeInfo";
    }

}
