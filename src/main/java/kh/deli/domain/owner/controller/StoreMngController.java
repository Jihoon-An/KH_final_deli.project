package kh.deli.domain.owner.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.domain.owner.service.OwnerStoreService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;

@Controller
@AllArgsConstructor
@RequestMapping("/store/mng")

public class StoreMngController {

    private final StoreStoreService storeStoreService;
    private final OwnerStoreService ownerStoreService;

    @RequestMapping()
    public String toStoreMng(Model model) throws Exception {
        int store_seq = 32;
        StoreDTO store = storeStoreService.storeInfo(store_seq); // 식당정보

        //식당 영업시간
        Map<String, Object> storeBsnsHours = new HashMap<>();
        String bsnsHours = String.valueOf(store.getStore_bsns_hours());
        System.out.println(bsnsHours);

        Gson gson = new Gson();
        Type type = new TypeToken<Map<String,Map<String,Object>>>() {}.getType();
        Map<String,Map<String,Object>> parsingStr = gson.fromJson(bsnsHours, type);
        System.out.println("파싱 : "+parsingStr);

        model.addAttribute("store", store);
        model.addAttribute("parsingStr", parsingStr);
        return "/owner/storeMng";
    }

    @PostMapping("/delete")
    public String deleteStore(int store_seq) throws Exception { //식당삭제
        int delete = storeStoreService.deleteStore(store_seq);
        //내 식당 리스트로
        return "redirect:/";
    }

    @PostMapping("/modify")
    public String modifyStore(StoreDTO storeDTO, MultipartFile file) throws Exception {
        ownerStoreService.modifyStore(storeDTO, file);
        System.out.println(storeDTO.getStore_close_day());
        System.out.println(storeDTO.getStore_bsns_hours());
        //내 식당 리스트로
        return "redirect:/";

    }
}
