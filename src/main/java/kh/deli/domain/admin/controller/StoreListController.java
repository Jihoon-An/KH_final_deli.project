package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.dto.AdminStoreDTO;
import kh.deli.domain.admin.service.AdminStoreService;
import lombok.AllArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/store/list/")
public class StoreListController {

    private final AdminStoreService adminStoreService;

    @RequestMapping("")
    public String toAdminStoreList(Model model) throws Exception {

        List<AdminStoreDTO> list = adminStoreService.selectAllStore();

        model.addAttribute("list", list);

        return "admin/adminStoreList";
    }

    @ResponseBody
    @PostMapping("deleteStore")
    public void deleteByStoreSeq(int store_seq) throws Exception {

        adminStoreService.deleteByStoreSeq(store_seq);
    }

    @ResponseBody
    @PostMapping("updateDisplayAsY")
    public void updateDisplayAsY(int store_seq) throws Exception {

        adminStoreService.updateDisplayAsY(store_seq);
    }

    @ResponseBody
    @PostMapping("updateDisplayAsN")
    public void updateDisplayAsN(int store_seq) throws Exception {

        adminStoreService.updateDisplayAsN(store_seq);
    }


}
