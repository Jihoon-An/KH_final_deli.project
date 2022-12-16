package kh.deli.domain.member.order.controller;

import kh.deli.domain.member.order.dto.OrderOrdersDTO;
import kh.deli.domain.member.order.service.OrderOrdersService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;




@Controller
@RequestMapping("/order/orders")
@AllArgsConstructor
public class OrdersController {

    private final HttpSession session;

    @Autowired
    OrderOrdersService orderOrdersService;

    private final OrderOrdersService ordersService;

    // 주문 페이지로 이동
    @RequestMapping("")
    public String toOrders() throws  Exception{
        return "/member/order/orders";
    }


    @RequestMapping("selectInitInfo")
    @ResponseBody
    public OrderOrdersDTO selectInitInfo(OrderOrdersDTO ordersDTO){
        //String accSeq = (String)session.getAttribute("acc_seq");

        return orderOrdersService.selectInitInfo(ordersDTO);
    }
    @RequestMapping("updateMemberAddr")
    @ResponseBody
    public void updateMemberAddr(OrderOrdersDTO ordersDTO){
        orderOrdersService.updateMemberAddr(ordersDTO);
    }



}
