package kh.deli.domain.member.header.controller;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/member/header/destination")
public class DestinationController {
    @RequestMapping("")
    public String selectAll(Model model) throws Exception {
//        List<AdminReviewDTO> nev_list = adminService.selectAll();
//        model.addAttribute("nev_list", nev_list);
        return "/member/header/destination";
    }

}
