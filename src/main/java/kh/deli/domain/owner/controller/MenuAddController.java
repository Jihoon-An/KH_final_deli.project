package kh.deli.domain.owner.controller;


import kh.deli.domain.owner.service.OwnerMenuService;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@AllArgsConstructor
@RequestMapping("/menu/add")
public class MenuAddController {



    private final HttpSession session;

    private  final OwnerMenuService storeMenuService;

    @RequestMapping("")
    public String toMenuAdd(){



        return "/owner/menuAdd2";
    }

//    @RequestMapping("/menuAdd")
//    public String menuAdd(MenuDTO menu, MenuOptionDTO menuop, MultipartFile file) throws IOException {
//
//
//
//
//        System.out.println(menu.getMenu_group());
//        System.out.println(menu.getStore_seq());
//        System.out.println(menu.getMenu_sold_out());
//        System.out.println(menu.getMenu_num());
//        System.out.println(menu.getMenu_img());
//
//        storeMenuService.insertMenu(menu, file);
//
//        return "redirect:/";
//    }
    @RequestMapping("/menuAdd")
    public String menuAdd(MenuDTO menuDTO, MenuOptionDTO menuOptionDTO, MultipartFile file) throws IOException {




        System.out.println(menuDTO.getMenu_group());
//        System.out.println(menu.getStore_seq());
//        System.out.println(menu.getMenu_sold_out());
//        System.out.println(menu.getMenu_num());
//        System.out.println(menu.getMenu_img());

        storeMenuService.insertMenu(menuDTO,menuOptionDTO, file);

        return "redirect:/";
    }

}
