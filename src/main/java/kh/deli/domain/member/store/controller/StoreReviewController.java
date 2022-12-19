package kh.deli.domain.member.store.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import kh.deli.domain.member.store.dto.StoreReviewDTO;
import kh.deli.domain.member.myPage.service.MemberReviewService;
import kh.deli.domain.member.store.service.StoreReviewService;
import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.print.DocFlavor;
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
            String mem_nick=(String)reviewInfoList.get(i).get("MEM_NICK");
            String rev_writeDate= String.valueOf(reviewInfoList.get(i).get("REV_WRITEDATE"));
            int REV_STAR = Integer.parseInt(String.valueOf(reviewInfoList.get(i).get("REV_STAR")));
            String rev_sysname=String.valueOf(reviewInfoList.get(i).get("REV_SYSNAME"));
            String rev_content = (String)reviewInfoList.get(i).get("REV_CONTENT");
            String menu_list=(String)reviewInfoList.get(i).get("MENU_LIST");

            ObjectMapper mapper = new ObjectMapper();

            List<List<Object>> tmp1 = mapper.readValue(rev_sysname, ArrayList.class);
            List<List<Object>> tmp2 = mapper.readValue(menu_list, ArrayList.class);

            List<String> store_rev_sysname = new ArrayList<>();
            for(int k=0; k<tmp1.size(); k++){
                System.out.println("파싱 : "+tmp1.get(k));
                store_rev_sysname.add(String.valueOf(tmp1.get(k)));
            }

            List<String> store_menu_list = new ArrayList<>();
                for(int k=0; k<tmp2.size(); k++){
                    System.out.println("파싱 : "+tmp2.get(k));
                    store_menu_list.add(String.valueOf(tmp2.get(k)));
                }
          storeReviewList.add(new StoreReviewDTO(mem_nick,rev_writeDate,REV_STAR,store_rev_sysname,rev_content,
                  store_menu_list));
        }
        model.addAttribute("storeInfoDTO", storeInfoDTO);
        model.addAttribute("storeReviewCount", storeReviewCount);
        model.addAttribute("storeReviewAvg", storeReviewAvg);
        model.addAttribute("storeReviewList", storeReviewList);
        return "/member/store/storeReview";
    }
}

