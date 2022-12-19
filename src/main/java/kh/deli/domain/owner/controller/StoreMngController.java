package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.controller.service.StoreStoreService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("/store/mng")

public class StoreMngController {

    private final StoreStoreService storeStoreService;

    @RequestMapping()
    public String toStoreMng(Model model) throws Exception{
        int store_seq=19;
        StoreDTO store=storeStoreService.storeInfo(store_seq);
        model.addAttribute("store",store);
        return "/owner/storeMng";
    }

    @PostMapping("/delete")
    public String deleteStore(int store_seq) throws Exception{
        int delete=storeStoreService.deleteStore(store_seq);
        System.out.println("삭제완;;");
        //내 식당 리스트로
        return "redirect:/";
    }

    @PostMapping("/modify")
        public String modifyStore(StoreDTO storeDTO,Integer store_seq) throws Exception{
        System.out.println(storeDTO.getStore_intro());
        int modify=storeStoreService.modifyStore(storeDTO,store_seq);
        //내 식당 리스트로
        return "redirect:/";
    }
}
