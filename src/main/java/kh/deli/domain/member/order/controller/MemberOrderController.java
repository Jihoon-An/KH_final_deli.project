package kh.deli.domain.member.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/order")
public class MemberOrderController {

    @RequestMapping("payResult")
    public String payResult() throws Exception{
        return "/member/order/memberOrder";
    }
}
