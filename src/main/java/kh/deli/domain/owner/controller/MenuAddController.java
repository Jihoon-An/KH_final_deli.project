package kh.deli.domain.owner.controller;


import com.google.gson.Gson;
import kh.deli.domain.owner.service.OwnerMenuService;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@AllArgsConstructor
@RequestMapping("/owner/menu/add")
public class MenuAddController {

    private final HttpSession session;
    private final OwnerMenuService ownerMenuService;

    @RequestMapping("")

    public String toMenuAdd(Model model, Integer store_seq) {

        model.addAttribute("store_seq", store_seq);
        return "/owner/menuAdd";
    }

    @RequestMapping("/menuAdd")
    public String menuAdd(MenuDTO menuDTO, MultipartFile file, int menu_seq) throws IOException {

        ownerMenuService.insertMenu(menuDTO, file, menu_seq);


        return "redirect:/";
    }


    @RequestMapping("/menuAddAjax")
    @ResponseBody
    public String menuAdd(MenuOptionDTO menuOptionDTO) throws Exception {
        ownerMenuService.insertMenuOption(menuOptionDTO);

        return "redirect:/";
    }

    @RequestMapping("getMenuSeq")
    @ResponseBody
    public int getMenuSeq() {
        int seq = ownerMenuService.getNextMenuSeq();

        return seq;
    }


}
