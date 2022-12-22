package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.service.OwnerOrdersService;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@AllArgsConstructor
@RequestMapping("/owner/order")
public class OrderMngController {
    private final OwnerOrdersService ordersService;

    @RequestMapping("{orderSeq}")
    public String toPage(Model model, @PathVariable("orderSeq") Integer inputOrderSeq) {
        Optional<Integer> orderSeq = Optional.ofNullable(inputOrderSeq);
        OrdersDTO order = ordersService.findBySeq(orderSeq.orElse(17));

        model.addAttribute("order", order);

        return "owner/orderMng";
    }
}
