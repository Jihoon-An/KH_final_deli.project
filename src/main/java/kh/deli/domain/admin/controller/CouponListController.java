package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.service.AdminCouponService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

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

    @PostMapping("/publish")
    @ResponseBody
    public String publish(String user_email, Integer cp_seq, Integer cp_period) {
        return cpService.isEmailExist(user_email, cp_seq, cp_period);
    }
}
