package kh.deli.domain.member.order.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.order.dto.OrderHistoryDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.order.service.OrderHistoryService;
import kh.deli.domain.member.order.service.OrderOrdersService;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.domain.member.store.dto.BasketMenu;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import kh.deli.domain.member.store.service.StoreBasketService;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/order/history")
public class OrderHistoryController {

    @Autowired
    private HttpSession session;
    @Autowired
    private OrderHistoryService orderHistoryService;


    private final OrderOrdersService orderOrdersService;
    private final OrderBasketService orderBasketService;
    private final Gson gson;
    private final StoreBasketService storeBasketService;

    @RequestMapping("")
    public String history(Model model) throws Exception {

        int acc_seq = (Integer) session.getAttribute("acc_seq");
        System.out.println(acc_seq);
        List<OrderHistoryDTO> orderList = orderHistoryService.selectOrderHistory(acc_seq);

        List<BasketMenu> menuList = new ArrayList<>();
        List<Integer> menuCountList = new ArrayList<>();


        for (int i = 0; i < orderList.size(); i++) {

            String getMenuList = orderList.get(i).getMenu_list();

            Type type2 = new TypeToken<List<StoreBasketMenuRequestDTO>>() {
            }.getType();
            List<StoreBasketMenuRequestDTO> parseMenuList = gson.fromJson(getMenuList, type2);

            List<BasketMenu> menuListName = storeBasketService.basketMenuListDtoToObject(parseMenuList);

            BasketMenu MenuName = menuListName.get(0);

            int menuCount = menuListName.size();

            menuList.add(MenuName);
            menuCountList.add(menuCount);
        }

        model.addAttribute("menu_count_list", menuCountList); //메뉴 갯수
        model.addAttribute("menu_list", menuList); // parse한 리스트
        model.addAttribute("order_list", orderList);  //join 되어 있는 list
        return "/member/order/ordersHistory";
    }

    @RequestMapping("/{orderSeq}")
    public String reOrder(@PathVariable("orderSeq") Integer order_seq) throws Exception {
        session.removeAttribute("basket");
        //가게 시퀸스 다르게 담아오면 오류라서 세션 삭제 후 진행
        OrdersDTO ordersDTO = orderOrdersService.findOrdersBySeq(order_seq);

        int storeSeq = ordersDTO.getStore_seq();
        int orderPrice = ordersDTO.getOrder_price();
        String menuListStr = ordersDTO.getMenu_list();
        //BasketDTO 매개변수 타입에 맞게끔

        Gson gson = new Gson();
        Type type = new TypeToken<List<StoreBasketMenuRequestDTO>>() {
        }.getType();
        List<StoreBasketMenuRequestDTO> basketList = gson.fromJson(menuListStr, type);
        BasketDTO basket = new BasketDTO(storeSeq, basketList, orderPrice);

        session.setAttribute("basket", basket);

        return "redirect:/basket";
    }


    @ResponseBody
    @RequestMapping("reviewChk")
    public boolean isExistReview(int order_seq) {
        boolean result = orderHistoryService.isExistReivew(order_seq);

        System.out.println(result + "리뷰체킹");
        return result;
    }
}
