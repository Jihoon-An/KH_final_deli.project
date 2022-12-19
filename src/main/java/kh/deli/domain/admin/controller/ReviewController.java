package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import kh.deli.domain.admin.service.AdminReviewService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/review")
public class ReviewController {

    private final AdminReviewService adminReviewService;

    @RequestMapping()
    public String selectAll(Model model) throws Exception {
        List<AdminReviewDTO> nev_list = adminReviewService.selectAll();
        model.addAttribute("nev_list", nev_list);
        return "/admin/reviewMng";
    }

    @ResponseBody
    @PostMapping("/deleteReview")
    public void deleteReview(int rev_seq) throws Exception{
        System.out.println(rev_seq);
        adminReviewService.deleteReview(rev_seq);
//        return "redirect:";
    }

    @ResponseBody
    @PostMapping("/modifyReviewDisplay")
    public void modifyReviewDisplay(int rev_seq,String rev_display) throws Exception{
        adminReviewService.modifyReviewDisplay(rev_seq,rev_display);
    }

}
