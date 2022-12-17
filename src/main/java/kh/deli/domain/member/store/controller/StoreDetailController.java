package kh.deli.domain.member.store.controller;

import kh.deli.domain.owner.service.OwnerStoreService;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store/detail")
@AllArgsConstructor
public class StoreDetailController {

    private final OwnerStoreService storeStoreService;


    @RequestMapping()
    public String toStoreDetail(Model model) throws Exception{
        int store_seq=16;
        StoreDTO storeDTO=storeStoreService.storeInfo(store_seq);
        MenuDTO menuDTO = storeStoreService.menuInfo(store_seq);
        model.addAttribute("storeDTO",storeDTO);
        model.addAttribute("menuDTO",menuDTO);
        return "/member/store/storeDetail";
    }
}
