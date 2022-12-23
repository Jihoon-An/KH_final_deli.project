package kh.deli.domain.member.store.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import kh.deli.domain.member.store.dto.StoreReviewDTO;
import kh.deli.domain.member.store.service.StoreReviewService;
import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import java.lang.reflect.Type;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@Controller
@AllArgsConstructor
@RequestMapping("/store/review")
public class StoreReviewController {

    private final StoreStoreService storeStoreService;
    private final StoreReviewService storeReviewService;
    private final OrderBasketService orderBasketService;

    @RequestMapping()
    public String toStoreReview(Model model) throws Exception {
        int store_seq = 19; //식당상세정보에서 seq

        StoreDTO storeInfoDTO = storeStoreService.getStoreInfo(store_seq); // 식당정보
        int storeReviewCount = storeReviewService.getReviewCount(store_seq); // 식당리뷰개수
        double storeReviewAvg = storeReviewService.getReviewAvg(store_seq); // 식당별점평균

        List<StoreReviewDTO> storeReviewList = new ArrayList<>();

        List<Map<String, Object>> reviewInfoList = storeReviewService.getReviewInfo(store_seq); // 식당 상세 리뷰페이지 리뷰 가져오기

        for (int revInfo = 0; revInfo < reviewInfoList.size(); revInfo++) {
            String memNick = (String) reviewInfoList.get(revInfo).get("MEM_NICK");
            String revWriteDate = String.valueOf(reviewInfoList.get(revInfo).get("REV_WRITEDATE"));
            String revModifiedDate = String.valueOf(reviewInfoList.get(revInfo).get("REV_MODIFIED_DATE"));
            int revStar = Integer.parseInt(reviewInfoList.get(revInfo).get("REV_STAR").toString());
            String revSysName = (String) reviewInfoList.get(revInfo).get("REV_SYSNAME");
            String revContent = (String) reviewInfoList.get(revInfo).get("REV_CONTENT");
            String menuList = (String) reviewInfoList.get(revInfo).get("MENU_LIST");


//            ObjectMapper mapper = new ObjectMapper();
//            List<List<Object>> tmp1 = mapper.readValue(revSysName, ArrayList.class);
//            List<List<Object>> tmp2 = mapper.readValue(menu_list, ArrayList.class);

            Gson gson = new Gson();
            Type type2 = new TypeToken<List<StoreBasketMenuRequestDTO>>(){}.getType();

            List<StoreBasketMenuRequestDTO> basket = gson.fromJson(menuList, type2);
            List<String>menu=new ArrayList<>();
            for (int i = 0; i < basket.size(); i++) {
                MenuDTO menuDTO = orderBasketService.findMenuBySeq(basket.get(i).getMenuSeq());
                menu.add(menuDTO.getMenu_name());
            }

//            //내가 주문한 메뉴명 가져오기
//            JSONParser jsonParser = new JSONParser();
//            JSONArray jsonArr =(JSONArray) jsonParser.parse(orders_dto.getMenu_list()); //파싱한 다음 jsonobject로 변환
//
//            List<String> menuNameList=new ArrayList<>();
//
//            if (jsonArr.size() > 0) {
//
//                for (int i = 0; i < jsonArr.size(); i++) {
//                    JSONObject jsonObj = (JSONObject)jsonArr.get(i);
//                    String menuSeq= jsonObj.get("menuSeq").toString();
//                    String menuName=myPageReviewService.selectMenuName(menuSeq);
//                    menuNameList.add(menuName);
//                }
//            }


            Type type1 = new TypeToken<List<String>>() {}.getType();
            List<String> tmp1 = gson.fromJson(revSysName, type1);

            storeReviewList.add(StoreReviewDTO.builder().
                    mem_nick(memNick).
                    rev_writedate(revWriteDate).
                    rev_modified_date(revModifiedDate).
                    rev_star(revStar).
                    rev_sysname(tmp1).
                    rev_content(revContent)
                    .menu_list(menu)
                    .build()
            );
//            storeReviewList.add(new StoreReviewDTO(mem_nick, rev_writeDate, rev_modified_date, REV_STAR, storeRevSysname, revContent,
//                    storeMenuList));
    }
        model.addAttribute("storeInfoDTO", storeInfoDTO);
        model.addAttribute("storeReviewCount", storeReviewCount);
        model.addAttribute("storeReviewAvg", storeReviewAvg);
        model.addAttribute("storeReviewList", storeReviewList);
        return "/member/store/storeReview";
    }
}

