package kh.deli.domain.admin.controller;


import kh.deli.domain.admin.dto.AdminOwnerDTO;
import kh.deli.domain.admin.service.AdminOwnerService;
import kh.deli.global.entity.StoreDTO;
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

        // System.out.println(owner_list.get(3).getStore_count());

        model.addAttribute("owner_list", owner_list);
        return "admin/adminOwnerList";
    }

    @RequestMapping("/deleteOwner")
    public String ownerDelete(int owner_seq){

        //owner_seq 로 모든 식당 삭제 해야하나?

        List<Integer> storeSeqlist= adminOwnerService.selectStoreSeq(owner_seq);

        for(int i = 0; i<storeSeqlist.size(); i++) {

            //System.out.println(list.get(i).intValue());

            int store_seq = storeSeqlist.get(i).intValue();
            // System.out.println(store_seq); //store_Seq 출력 확인

            List<Integer> menuSeqList = adminOwnerService.selectMenuSeq(storeSeqlist.get(i).intValue());



            for (int j = 0; j < menuSeqList.size(); j++) {
                System.out.println(menuSeqList.get(j).intValue());//menu_seq 리스트출력
                int menu_seq = menuSeqList.get(j).intValue();
//            //    System.out.println(menu_seq);
                adminOwnerService.deleteMenuOption(menu_seq); //menu_seq로 menu_option 삭제
                adminOwnerService.deleteMenu(store_seq);        //store_seq로 menu삭제

            }


        }
        adminOwnerService.deleteStore(owner_seq); //식당삭제
        //adminOwnerService.deleteOwner(owner_seq); //사업자 회원 삭제
        return "redirect:";
    }
}
