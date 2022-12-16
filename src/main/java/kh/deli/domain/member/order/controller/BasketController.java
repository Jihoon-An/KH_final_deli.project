package kh.deli.domain.member.order.controller;

import kh.deli.domain.member.order.dto.OrderBasketDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("/basket")
public class BasketController {

    private final OrderBasketService basketService;

    @RequestMapping("")
    public String toBasket() throws Exception {

        OrderBasketDTO sampleBasket = basketService.getSample();

        /**
         * <h3>OrderBasketDTO 뽑아내야 할 데이터</h3>
         * - StoreDTO 상호명
         * - StoreDTO 배달팁
         * - OrderBasketMenuDTO -> MenuDTO 메뉴명
         * - OrderBasketMenuDTO -> MenuOptionDTO 옵션 리스트 -> 옵션명,
         * - MenuDTO 메뉴 가격
         * - MenuDTO 메뉴
         */





        return "member/order/basket";
    }


}
