package kh.deli.domain.member.store.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.myPage.service.MemberReviewService;
import kh.deli.domain.member.store.dto.CategoryResponseDTO;
import kh.deli.domain.owner.controller.service.StoreMenuService;
import kh.deli.domain.owner.controller.service.StoreStoreService;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/store/menu")
@AllArgsConstructor
public class StoreMenuController {

    private final StoreStoreService storeStoreService;
    private final StoreMenuService storeMenuService;
    private final MemberReviewService memberReviewService;

    @RequestMapping()
    public String toStoreDetail(Model model) throws Exception {

        int store_seq = 19;

        StoreDTO storeDTO = storeStoreService.storeInfo(store_seq); //가게 정보

        List<String> menuGroup = storeMenuService.menuInfo(store_seq); //메뉴 카테고리

        List<CategoryResponseDTO> categoryList = new ArrayList<>();

        for (int mgroup = 0; mgroup < menuGroup.size(); mgroup++) {

            //카테고리별 메뉴들 뽑아오기;;;;;;
            List<MenuDTO> menuList = storeMenuService.menuList(menuGroup.get(mgroup), store_seq);
            categoryList.add(new CategoryResponseDTO(menuGroup.get(mgroup), menuList));

        }

        int storeReviewCount = memberReviewService.getReviewCount(store_seq);  //가게 리뷰 개수

        double storeReviewAvg = memberReviewService.getReviewAvg(store_seq); //가게 리뷰 평점

        model.addAttribute("storeDTO", storeDTO);
        model.addAttribute("menuGroup", menuGroup);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("storeReviewCount", storeReviewCount);
        model.addAttribute("storeReviewAvg", storeReviewAvg);
        return "/member/store/storeDetail";
    }
}

