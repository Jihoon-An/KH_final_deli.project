package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.service.AdminCouponService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/couponList")
@AllArgsConstructor
public class CouponListController {

    private final AdminCouponService couponService;

    @RequestMapping("")
    public String toCouponList() {
        return "admin/couponList";
    }

}
