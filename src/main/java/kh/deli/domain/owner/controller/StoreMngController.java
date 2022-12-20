package kh.deli.domain.owner.controller;

import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.domain.owner.service.OwnerStoreService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.Session;
import javax.mail.Store;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
@Controller
@AllArgsConstructor
@RequestMapping("/store/mng")

public class StoreMngController {

    private final StoreStoreService storeStoreService;
    private final OwnerStoreService ownerStoreService;

    @RequestMapping()
    public String toStoreMng(Model model) throws Exception {
        int store_seq = 13;
        StoreDTO store = storeStoreService.storeInfo(store_seq);
        model.addAttribute("store", store);
        return "/owner/storeMng";
    }

    @PostMapping("/delete")
    public String deleteStore(int store_seq) throws Exception {
        int delete = storeStoreService.deleteStore(store_seq);
        System.out.println("삭제완;;");
        //내 식당 리스트로
        return "redirect:/";
    }

    @PostMapping("/modify")
    public String modifyStore(StoreDTO storeDTO, Integer store_seq, MultipartFile file) throws Exception {
        ownerStoreService.modifyStore(storeDTO, store_seq, file);
        //내 식당 리스트로
        return "redirect:/";

    }
}
