package kh.deli.domain.member.store.controller;

import kh.deli.domain.member.myPage.service.MyPageDibsService;
import kh.deli.domain.member.store.dto.CategoryResponseDTO;
import kh.deli.domain.member.store.service.StoreMenuService;
import kh.deli.domain.member.store.service.StoreReviewService;
import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/store/menu")
@AllArgsConstructor
public class StoreMenuController {

    private final StoreStoreService storeStoreService;
    private final StoreMenuService storeMenuService;
    private final StoreReviewService storeReviewService;

    private final MyPageDibsService myPageDibsService;
    private final HttpSession session;

    @RequestMapping("/{storeSeq}")
    public String toStoreDetail(@PathVariable("storeSeq") Integer store_seq, Model model) throws Exception {

        StoreDTO storeInfoDTO = storeStoreService.getStoreInfo(store_seq); //가게 정보

        List<String> menuGroup = storeMenuService.getMenuInfo(store_seq); //메뉴 카테고리

        List<CategoryResponseDTO> categoryList = new ArrayList<>();

        for (int mgroup = 0; mgroup < menuGroup.size(); mgroup++) {

            //카테고리별 메뉴들 뽑아오기
            List<MenuDTO> menuList = storeMenuService.getMenuList(menuGroup.get(mgroup), store_seq);
            categoryList.add(new CategoryResponseDTO(menuGroup.get(mgroup), menuList));

        }

        int storeReviewCount = storeReviewService.getReviewCount(store_seq);  // 식당리뷰개수

        double storeReviewAvg = storeReviewService.getReviewAvg(store_seq); // 식당별점평균

        int acc_seq = (Integer) session.getAttribute("acc_seq"); //찜
        int result = myPageDibsService.isExistDibs(acc_seq, store_seq);

        model.addAttribute("storeInfoDTO", storeInfoDTO);
        model.addAttribute("menuGroup", menuGroup);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("storeReviewCount", storeReviewCount);
        model.addAttribute("storeReviewAvg", storeReviewAvg);
        model.addAttribute("result", result);
        return "/member/store/storeDetail";
    }
}

