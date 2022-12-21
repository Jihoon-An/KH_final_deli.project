package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.service.OwnerMenuService;
import kh.deli.global.entity.MenuDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/owner/menu")
@AllArgsConstructor
// ownerMenuController 로 이름 바꾸기
public class MenuModifyController {

    private final OwnerMenuService ownerMenuService;

//    @RequestMapping("modifyMenu")
//    public MenuDTO modifyMenu(MenuDTO menuDTO){OwnerMenuService.modifyMenu(menuDTO);}
}
