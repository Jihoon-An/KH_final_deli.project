package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import kh.deli.domain.admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/")
public class AdminReviewController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("selectReview")
    public String selectAll(Model model) throws Exception {
        List<AdminReviewDTO> nev_list = adminService.selectAll();
        model.addAttribute("nev_list", nev_list);
        return "/admin/adminReviewMng";
    }

    @RequestMapping("deleteReview")
    public String deleteReview(int rev_seq) throws Exception{
        adminService.deleteReview(rev_seq);
        return "redirect:/admin/selectReview";
    }

}
