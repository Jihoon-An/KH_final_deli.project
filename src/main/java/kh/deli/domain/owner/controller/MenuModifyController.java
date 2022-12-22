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
@RequestMapping("/owner/menu")
@AllArgsConstructor
// ownerMenuController 로 이름 바꾸기
public class MenuModifyController {

    private final HttpSession session;

    private final OwnerMenuService ownerMenuService;


    @RequestMapping("")
    public String toModifyMenu(){

        return "/owner/menuModify";
    }
    @RequestMapping("/modifyMenu")
    public String modifyMenu(MenuDTO menuDTO, MultipartFile file, int menu_seq)throws IOException {
        ownerMenuService.modifyMenu(menuDTO, file, menu_seq);

        return "redirect:/";

    }

}
