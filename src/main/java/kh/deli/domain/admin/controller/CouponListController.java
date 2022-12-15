package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.service.AdminCouponService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/couponList")
@AllArgsConstructor
public class CouponListController {

    private final AdminCouponService cpService;

    @RequestMapping("")
    public String toCouponList(Model model) {

        model.addAttribute("cpList",cpService.getAll());

        return "admin/couponList";
    }

}
