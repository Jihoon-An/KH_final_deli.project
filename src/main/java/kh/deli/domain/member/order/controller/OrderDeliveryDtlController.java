package kh.deli.domain.member.order.controller;

import kh.deli.domain.member.order.dto.OrdererInfoDTO;
import kh.deli.domain.member.order.dto.PayInfoDTO;
import kh.deli.domain.member.order.dto.StoreInfoDTO;
import kh.deli.domain.member.order.service.OrderOrdersService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("deliveryDtl")
public class OrderDeliveryDtlController {
    private final OrderOrdersService orderOrdersService;
    @RequestMapping("")
    public String toDeliveryDtl(Model model) throws Exception {

        int order_seq = 9;
        StoreInfoDTO storeInfoDTO = orderOrdersService.storeInfo(order_seq);
        OrdererInfoDTO ordererInfoDTO =orderOrdersService.ordererInfo(order_seq);
        PayInfoDTO payInfoDTO=orderOrdersService.payInfo(order_seq);
        model.addAttribute("storeInfoDTO",storeInfoDTO);
        model.addAttribute("ordererInfoDTO",ordererInfoDTO);
        model.addAttribute("payInfoDTO",payInfoDTO);

        return "member/order/deliveryDtl";
    }
}
