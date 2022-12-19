package kh.deli.domain.member.store.controller;

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

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/store/menu")
@AllArgsConstructor
public class StoreMenuController {

    private final StoreStoreService storeStoreService;
    private final StoreMenuService storeMenuService;
    private final MemberReviewService memberReviewService;

    @RequestMapping()
    public String toStoreDetail(Model model) throws Exception {

        List<CategoryResponseDTO> categoryList = new ArrayList<>();
        int store_seq = 16;
        String menu_group = "햄버거";

        StoreDTO storeDTO = storeStoreService.storeInfo(store_seq);
        List<String> menuGroup = storeMenuService.menuInfo(store_seq);

        for (int i = 0; i < menuGroup.size(); i++) {
            List<MenuDTO> menuList = storeMenuService.menuList(menuGroup.get(i), store_seq);
            categoryList.add(new CategoryResponseDTO(menuGroup.get(i), menuList));
        }

        List<StoreDTO> menuOrigin = storeStoreService.menuOrigin();

        int storeReviewCount = memberReviewService.getReviewCount(store_seq);
        double storeReviewAvg=memberReviewService.getReviewAvg(store_seq);
        model.addAttribute("storeDTO", storeDTO);
        model.addAttribute("menuGroup", menuGroup);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("menuOrigin", menuOrigin);
        model.addAttribute("storeReviewCount", storeReviewCount);
        model.addAttribute("storeReviewAvg",storeReviewAvg);
        return "/member/store/storeDetail";
    }
}
