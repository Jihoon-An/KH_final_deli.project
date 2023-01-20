package kh.deli.domain.member.order.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.order.dto.OrdererInfoDTO;
import kh.deli.domain.member.order.dto.PayInfoDTO;
import kh.deli.domain.member.order.dto.StoreInfoDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.order.service.OrderOrdersService;
import kh.deli.domain.member.store.dto.BasketMenu;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import kh.deli.domain.member.store.service.StoreBasketService;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.lang.reflect.Type;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/order/detail")
public class OrdersDetailController {
    private final OrderOrdersService orderOrdersService;
    private final OrderBasketService orderBasketService;

    private final StoreBasketService storeBasketService;
    private final Gson gson;
    @RequestMapping("{orderSeq}")
    public String getStoreInfo(@PathVariable("orderSeq") Integer order_seq, Model model) throws Exception{

//        order_seq=31;

        StoreInfoDTO storeInfoDTO = orderOrdersService.getStoreInfo(order_seq); // 가게정보
        OrdererInfoDTO ordererInfoDTO =orderOrdersService.getOrdererInfo(order_seq); // 주문자정보
        PayInfoDTO payInfoDTO=orderOrdersService.getPayInfo(order_seq); // 결제정보
        OrdersDTO ordersDTO = orderOrdersService.findOrdersBySeq(order_seq); //주문정보

        String menu_list = ordersDTO.getMenu_list();

        Type type2 = new TypeToken<List<StoreBasketMenuRequestDTO>>(){}.getType();
        List<StoreBasketMenuRequestDTO> basket= gson.fromJson(menu_list, type2);

        List<BasketMenu> basketMenu =storeBasketService.basketMenuListDtoToObject(basket);

        model.addAttribute("basketMenu", basketMenu);
        model.addAttribute("storeInfoDTO",storeInfoDTO);
        model.addAttribute("ordererInfoDTO",ordererInfoDTO);
        model.addAttribute("payInfoDTO",payInfoDTO);

        return "/member/order/orderDetail";
    }



}
