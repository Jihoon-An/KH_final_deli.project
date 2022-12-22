package kh.deli.domain.member.order.controller;

import com.google.gson.Gson;
import kh.deli.domain.member.order.dto.OrderBasketDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("/basket")
public class BasketController {

    private final OrderBasketService basketService;
    private final HttpSession session;
    private final Gson gson;

    @RequestMapping("")
    public String toBasket(Model model) throws Exception {

        OrderBasketDTO basketDTO = (OrderBasketDTO) session.getAttribute("basket");


        basketService.findStoreBySeq(0);
        basketService.findMenuBySeq(0);
        basketService.findMenuOptionBySeq(0);



//        OrderBasketDTO basketDTO = gson.fromJson(basket, OrderBasketDTO.class);

//        System.out.println(basket);
//        System.out.println(basketDTO);


//        OrderBasketDTO sampleBasket = basketService.getSample();


//        StoreDTO storeDTO = basketDTO.getStore();
//        List<OrderBasketMenuDTO> menuList = basketDTO.getMenuList();
        int totalPrice = basketDTO.getTotalPrice();
        int deliveryTip = basketDTO.getStore().getStore_deli_tip();
        int totalCount = basketService.getTotalCount(basketDTO.getMenuList());

        model.addAttribute("basket", basketDTO);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("payAmount", (totalPrice + deliveryTip));
        model.addAttribute("totalCount", totalCount);

//        Gson gson = new Gson();
//        String basketJson = gson.toJson(sampleBasket);
//        basketService.insertSampleBasket(basketJson);
//
//        StoreBasketDTO basket = gson.fromJson(basketJson, StoreBasketDTO.class);




        return "member/order/basket";
    }


//    private void setBasketCookie(String basket, HttpServletResponse response) throws UnsupportedEncodingException {
//        basket = URLEncoder.encode(basket, "utf-8");
//        Cookie cookie = new Cookie("basket", basket);
//
//        cookie.setMaxAge(60 * 60 * 24 * 14);//14일
//        cookie.setPath("/");
//
//        response.addCookie(cookie);
//    }

}

