package kh.deli.domain.member.order.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("/member/order")
public class OrderDetailController {

    @RequestMapping()
    public String orderDetail() throws Exception{
        return "/member/order/orderDetail";
    }

}
