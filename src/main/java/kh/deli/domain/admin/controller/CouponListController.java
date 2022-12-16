package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.service.AdminCouponService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/coupon/list")
@AllArgsConstructor
public class CouponListController {

    private final AdminCouponService cpService;

    @RequestMapping("")
    public String toCouponList(Model model) {

        model.addAttribute("cpList", cpService.getAll());

        return "admin/couponList";
    }

    @PostMapping("/delete")
    @ResponseBody
    public void delete(int seq) {
        cpService.deleteBySeq(seq);
    }
}
