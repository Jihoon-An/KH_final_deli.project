package kh.deli.domain.owner.controller;


import kh.deli.domain.owner.service.OwnerMenuService;
import kh.deli.global.entity.MenuDTO;
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
        return "/owner/menuAdd";
    }
    
    @RequestMapping("/menuAdd")
    public String menuAdd(MenuDTO dto, MultipartFile file) throws IOException {

        System.out.println(dto.getMenu_group());
        System.out.println(dto.getStore_seq());
        System.out.println(dto.getMenu_sold_out());
        System.out.println(dto.getMenu_num());
        System.out.println(dto.getMenu_img());

        storeMenuService.insertMenu(dto, file);

        return "redirect:/";
    }
}
