package kh.deli.domain.member.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrdersController {

    @RequestMapping("/orders")
    public String toOrders() {
        return "order/orders";
    }

}
