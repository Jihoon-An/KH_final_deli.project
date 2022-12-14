package kh.deli.domain.member.order.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("/basket")
public class BasketController {

    @RequestMapping("")
    public String toBasket() throws Exception {
        return "member/order/basket";
    }

}
