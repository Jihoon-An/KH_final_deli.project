package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.service.OwnerInfoService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("/owner/info")
public class OwnerInfoController {

    private final HttpSession session;
    private final OwnerInfoService ownerInfoService;

    @RequestMapping("")
    public String toOwnerInfo() throws Exception {

        

        return "/owner/ownerInfo";
    }

}
