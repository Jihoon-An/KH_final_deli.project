package kh.deli.domain.member.order.controller;

import kh.deli.domain.member.order.service.OrderOrdersService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order/orders")
@AllArgsConstructor
public class OrdersController {

    private final HttpSession session;

    private final OrderOrdersService ordersService;

    // 주문 페이지로 이동
    @RequestMapping("")
    public String toOrders() throws  Exception{
        return "order/orders";
    }

    //주문 입력



}
