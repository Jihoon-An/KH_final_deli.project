package kh.deli.domain.member.store.controller;


import kh.deli.domain.owner.controller.service.StoreMenuService;
import kh.deli.global.entity.MenuDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@AllArgsConstructor
@RequestMapping("/menu")
public class MenuController {



    private final HttpSession session;

    private  final StoreMenuService storeMenuService;

    @RequestMapping("")
    public String toMenuAdd(){



        return "/member/store/menuAdd";
    }

    @RequestMapping("menuAdd")
    public String menuAdd(MenuDTO dto, MultipartFile file) throws IOException {




        System.out.println(dto.getMenu_group());
        System.out.println(dto.getStore_seq());
        System.out.println(dto.getMenu_sold_out());
        System.out.println(dto.getMenu_num()+"num");
        System.out.println(dto.getMenu_img());

        storeMenuService.insertMenu(dto, file);

        return "redirect:/";
    }

    @RequestMapping("optionModify")
    public void optionModify(){

    }
}
