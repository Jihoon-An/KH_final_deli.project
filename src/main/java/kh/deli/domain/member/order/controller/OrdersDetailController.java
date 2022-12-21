package kh.deli.domain.member.order.controller;

import com.google.gson.Gson;
import kh.deli.domain.member.order.dto.OrderBasketDTO;
import kh.deli.domain.member.order.dto.OrdererInfoDTO;
import kh.deli.domain.member.order.dto.PayInfoDTO;
import kh.deli.domain.member.order.dto.StoreInfoDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.order.service.OrderOrdersService;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("/member/order/detail")
public class OrdersDetailController {
    private final OrderOrdersService orderOrdersService;
    private final OrderBasketService orderBasketService;
    private final Gson gson;
    @RequestMapping("")
    public String storeInfo(Model model) throws Exception{
        int order_seq=9;
        StoreInfoDTO storeInfoDTO = orderOrdersService.storeInfo(order_seq); // 가게정보
        OrdererInfoDTO ordererInfoDTO =orderOrdersService.ordererInfo(order_seq); // 주문자정보


        PayInfoDTO payInfoDTO=orderOrdersService.payInfo(order_seq); // 결제정보
        model.addAttribute("storeInfoDTO",storeInfoDTO);
        model.addAttribute("ordererInfoDTO",ordererInfoDTO);
        model.addAttribute("payInfoDTO",payInfoDTO);


        OrdersDTO ordersDTO = orderOrdersService.findOrdersBySeq(18);

        String menu_list = ordersDTO.getMenu_list();

        OrderBasketDTO basket = gson.fromJson(menu_list, OrderBasketDTO.class);




        return "/member/order/orderDetail";
    }



}
