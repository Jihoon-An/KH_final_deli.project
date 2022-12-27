package kh.deli.domain.member.order.controller;


import ch.qos.logback.core.BasicStatusManager;
import ch.qos.logback.core.net.SyslogOutputStream;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import com.google.gson.*;

import com.google.gson.reflect.TypeToken;
import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;
import kh.deli.domain.member.order.dto.OrderDetailDTO;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@AllArgsConstructor
@RequestMapping("/member/order/")
public class OrderHistoryController {

    @Autowired
    private HttpSession session;
    @Autowired
    private OrderHistoryService orderHistoryService;


    private final OrderOrdersService orderOrdersService;
    private final OrderBasketService orderBasketService;
    private final Gson gson;
    private final StoreBasketService storeBasketService;
    @RequestMapping("history")
    public String history(Model model) throws Exception {

        int acc_seq = (Integer) session.getAttribute("acc_seq");
        List<OrderHistoryDTO> menuList= orderHistoryService.selectOrderHistory(acc_seq);

        List<BasketMenu> basketMenu = new ArrayList<>();

        for(int i = 0; i<menuList.size(); i++) {
            String menu_list = menuList.get(i).getMenu_list();
            Type type2 = new TypeToken<List<StoreBasketMenuRequestDTO>>(){}.getType();
            List<StoreBasketMenuRequestDTO> basket = gson.fromJson(menu_list, type2);


           basketMenu =storeBasketService.basketMenuListDtoToObject(basket);

            System.out.println(basketMenu.get(i).getMenu());
        }



        model.addAttribute("basketMenu", basketMenu);

        model.addAttribute("menu_list", menuList);
        return "/member/order/ordersHistory";
    }
}
