package kh.deli.domain.member.store.controller;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import kh.deli.domain.member.store.dto.StoreReviewDTO;
import kh.deli.domain.member.myPage.service.MemberReviewService;
import kh.deli.domain.owner.controller.service.StoreReviewService;
import kh.deli.domain.owner.controller.service.StoreStoreService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.print.DocFlavor;
import java.lang.reflect.Type;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
@AllArgsConstructor
@RequestMapping("/store/review")
public class StoreReviewController {

    private final StoreStoreService storeStoreService;
    private final MemberReviewService memberReviewService;

    private final StoreReviewService storeReviewService;


    @RequestMapping()
    public String toStoreReview(Model model) throws Exception {
        int store_seq = 19;
        int acc_seq = 9; //사업자 acc_seq
        StoreDTO storeInfoDTO = storeStoreService.storeInfo(store_seq);

        int storeReviewCount = memberReviewService.getReviewCount(store_seq);
        double storeReviewAvg = memberReviewService.getReviewAvg(store_seq);

        List<StoreReviewDTO> storeReviewList = new ArrayList<>();

        List<Map<String, Object>> reviewInfoList = storeReviewService.getReviewInfo(store_seq);
        System.out.println(reviewInfoList.get(1).get("REV_CONTENT"));

        for (int i = 0; i < reviewInfoList.size(); i++) {
            String memNick = (String) reviewInfoList.get(i).get("MEM_NICK");
            String revWriteDate = String.valueOf(reviewInfoList.get(i).get("REV_WRITEDATE"));
            String revModifiedDate = String.valueOf(reviewInfoList.get(i).get("REV_MODIFIED_DATE"));
            int revStar = Integer.parseInt(reviewInfoList.get(i).get("REV_STAR").toString());
            String revSysName = (String) reviewInfoList.get(i).get("REV_SYSNAME");
            String revContent = (String) reviewInfoList.get(i).get("REV_CONTENT");
            String menuList = (String) reviewInfoList.get(i).get("MENU_LIST");

//            ObjectMapper mapper = new ObjectMapper();
//            List<List<Object>> tmp1 = mapper.readValue(revSysName, ArrayList.class);
//            List<List<Object>> tmp2 = mapper.readValue(menu_list, ArrayList.class);

            Gson gson = new Gson();

            Type type = new TypeToken<List<String>>() {}.getType();
            List<String> tmp1 = gson.fromJson(revSysName, type);
            List<String> tmp2 = gson.fromJson(menuList, type);

//            List<String> storeRevSysname = new ArrayList<>();
//            for (int k = 0; k < tmp1.size(); k++) {
//                System.out.println("파싱 : " + tmp1.get(k));
//                storeRevSysname.add(String.valueOf(tmp1.get(k)));
//            }
//
//            List<String> storeMenuList = new ArrayList<>();
//            for (int k = 0; k < tmp2.size(); k++) {
//                System.out.println("파싱 : " + tmp2.get(k));
//                storeMenuList.add(String.valueOf(tmp2.get(k)));
//            }

            storeReviewList.add(StoreReviewDTO.builder().
                    mem_nick(memNick).
                    rev_writedate(revWriteDate).
                    rev_modified_date(revModifiedDate).
                    rev_star(revStar).
                    rev_sysname(tmp1).
                    rev_content(revContent)
                    .menu_list(tmp2)
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

