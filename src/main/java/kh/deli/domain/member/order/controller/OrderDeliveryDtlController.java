package kh.deli.domain.member.order.controller;

import com.google.gson.Gson;
import kh.deli.domain.member.order.dto.OrderDetailDTO;
import kh.deli.domain.member.order.dto.OrdererInfoDTO;
import kh.deli.domain.member.order.dto.PayInfoDTO;
import kh.deli.domain.member.order.dto.StoreInfoDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.order.service.OrderOrdersService;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.util.naverSensV2.NaverNShortURL;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("deliveryDtl")
public class OrderDeliveryDtlController {

    private final OrderOrdersService orderOrdersService;
    private final OrderBasketService orderBasketService;
    private final Gson gson;

    @RequestMapping("{orderSeq}")
    public String toDeliveryDtl(Model model, @PathVariable int orderSeq) throws Exception {


        StoreInfoDTO storeInfoDTO = orderOrdersService.getStoreInfo(orderSeq); // 가게정보
        OrdererInfoDTO ordererInfoDTO =orderOrdersService.getOrdererInfo(orderSeq); // 주문자정보
        PayInfoDTO payInfoDTO=orderOrdersService.getPayInfo(orderSeq); // 결제정보
        OrdersDTO ordersDTO = orderOrdersService.findOrdersBySeq(orderSeq); //주문정보

        String menu_list = ordersDTO.getMenu_list();

        BasketDTO basket = gson.fromJson(menu_list, BasketDTO.class);

        List<OrderDetailDTO> orderDetailDTOList = new ArrayList<>();

        for (int i = 0; i<basket.getMenuList().size(); i++) {
            MenuDTO menuDTO = orderBasketService.findMenuBySeq(basket.getMenuList().get(i).getMenuSeq());
            List<MenuOptionDTO> menuOptionDTOList = new ArrayList<>();

            for (int k = 0; k < basket.getMenuList().get(i).getOptionSeqList().size(); k++) {
                MenuOptionDTO menuOptionDTO = orderBasketService.findMenuOptionBySeq(basket.getMenuList().get(i).getOptionSeqList().get(k));
                menuOptionDTOList.add(menuOptionDTO);
            }

            int count = basket.getMenuList().get(i).getCount();
            int price = basket.getMenuList().get(i).getPrice();

            OrderDetailDTO orderDetailDTO = new OrderDetailDTO(menuDTO, menuOptionDTOList, count, price);

            orderDetailDTOList.add(orderDetailDTO);
        }

        model.addAttribute("orderDetailDTOList", orderDetailDTOList);
        model.addAttribute("storeInfoDTO",storeInfoDTO);
        model.addAttribute("ordererInfoDTO",ordererInfoDTO);
        model.addAttribute("payInfoDTO",payInfoDTO);

//        // 아래는 주소 줄이는 shortURL 코드
//        String url = "https://developers.naver.com/forum/posts/33899";
//        NaverNShortURL nShortURL = new NaverNShortURL();
//        nShortURL.toShortURL(url);
//        System.out.println(url);

        return "member/order/deliveryDtl";
    }
}
