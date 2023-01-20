package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.service.AdminCouponService;
import kh.deli.global.entity.CouponDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/coupon/add")
@AllArgsConstructor
public class AddCouponController {

    private final AdminCouponService couponService;

    //쿠폰 추가 페이지로 이동
    @RequestMapping("")
    public String toPage() throws Exception {
        return "admin/addCoupon";
    }

    //쿠폰 추가
    @PostMapping("/add")
    public String addCoupon(CouponDTO coupon) throws Exception {

        //쿠폰코드 유효성
        if (coupon.getCp_code() != null && couponService.dupleCheck(coupon.getCp_code())) {
            return "error";
        }

        couponService.put(coupon);

        return "redirect:/admin/coupon/list";
    }

    @PostMapping("/dupleCheck")
    @ResponseBody
    public boolean dupleCheck(String code) throws Exception {
        return couponService.dupleCheck(code);
    }
}
