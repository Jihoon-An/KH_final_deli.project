package kh.deli.domain.member.order.controller;

import kh.deli.domain.member.order.dto.OrderBasketDTO;
import kh.deli.domain.member.order.dto.OrderBasketMenuDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/basket")
public class BasketController {

    private final OrderBasketService basketService;

    @RequestMapping("")
    public String toBasket(Model model) throws Exception {

        OrderBasketDTO sampleBasket = basketService.getSample();

        StoreDTO storeDTO = sampleBasket.getStore();
        List<OrderBasketMenuDTO> menuList = sampleBasket.getMenuList();
        int totalPrice = sampleBasket.getTotalPrice();

        model.addAttribute("basket", sampleBasket);
        model.addAttribute("totalPrice", totalPrice);

//        Gson gson = new Gson();
//        model.addAttribute("basketToJson", gson.toJson(sampleBasket));



        return "member/order/basket";
    }


}
