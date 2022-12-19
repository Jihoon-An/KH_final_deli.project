package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.service.OwnerMainService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("/owner/")
public class OwnerMainController {

    private final OwnerMainService ownerMainService;

    @RequestMapping("selectSales")
    public String toMenuAdd(){

        System.out.println("매출보기");
        return "/owner/ownerMain";
    }

}
