package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.dto.AdminStoreDTO;
import kh.deli.domain.admin.service.AdminStoreService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/store/list")
public class StoreListController {

    private final AdminStoreService adminStoreService;

    @RequestMapping("")
    public String toAdminStoreList(Model model) throws Exception{

        List<AdminStoreDTO> list = adminStoreService.selectAllStore();


        System.out.println(list.get(1));

        model.addAttribute("list",list);

        return "admin/adminStoreList";
    }

    public AdminStoreDTO selectByStore_seq(int store_seq) throws Exception{

        AdminStoreDTO dto = adminStoreService.selectByStore_seq(store_seq);

        return dto;
    }


}
