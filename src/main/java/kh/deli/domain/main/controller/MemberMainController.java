package kh.deli.domain.main.controller;

import kh.deli.domain.main.dto.MemberMainRequestDTO;
import kh.deli.domain.main.service.MemberMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/memberMain/")
public class MemberMainController {

    @Autowired
    private MemberMainService memberMainService;

    @RequestMapping("toMemberMain")
    public String toMemberMain(Model model) throws Exception {
        List<MemberMainRequestDTO> list = memberMainService.selectByStar();
        model.addAttribute("list",list);
        return "main/memberMain";
    }
}
