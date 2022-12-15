package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import kh.deli.domain.admin.service.AdminReviewService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/review/")
public class ReviewController {

    private final AdminReviewService adminReviewService;

    @RequestMapping("selectReview")
    public String selectAll(Model model) throws Exception {
        List<AdminReviewDTO> nev_list = adminReviewService.selectAll();
        model.addAttribute("nev_list", nev_list);
        return "/admin/ReviewMng";
    }

    @RequestMapping("deleteReview")
    public String deleteReview(int rev_seq) throws Exception{
        adminReviewService.deleteReview(rev_seq);
        return "redirect:/admin/review/selectReview";
    }

}
