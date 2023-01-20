package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.service.OwnerStoreService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("owner/store/add")
public class StoreAddController {


    private final HttpSession session;

    private final OwnerStoreService storeService;

    @RequestMapping("")
    public String toAdd(){
        return "/owner/storeAdd";
    }
    @RequestMapping("/storeAdd")
    public String add(StoreDTO dto, MultipartFile file, int acc_seq) throws Exception {


      storeService.insertStore(dto, file, acc_seq);

        return "redirect:/owner/store/list";
    }
}
