package kh.deli.domain.admin.controller;


import kh.deli.domain.admin.dto.AdminOwnerDTO;
import kh.deli.domain.admin.service.AdminOwnerService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
@AllArgsConstructor
@Controller
@RequestMapping("/admin/owner/list")
public class OwnerListController {

    private  final AdminOwnerService adminOwnerService;
   @RequestMapping("")
    public String toAdminOwner(Model model){
        List<AdminOwnerDTO> owner_list = adminOwnerService.selectOwnerList();

        System.out.println(owner_list.get(3).getStore_count());

        model.addAttribute("owner_list", owner_list);
        return "admin/adminOwnerList";
    }

    @RequestMapping("/deleteOwner")
    public String ownerDelete(int owner_seq){
        adminOwnerService.deleteOwner(owner_seq);
        return "redirect:";
   }
}
