package kh.deli.domain.member.order.controller;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.order.dto.OrderHistoryDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.order.service.OrderHistoryService;
import kh.deli.domain.member.order.service.OrderOrdersService;
import kh.deli.domain.member.store.dto.BasketMenu;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import kh.deli.domain.member.store.service.StoreBasketService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.util.ArrayList;
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
        List<OrderHistoryDTO> menuList= orderHistoryService.selectOrderHistory(acc_seq);

      List<BasketMenu> basketMenu = new ArrayList<>();

        for(int i = 0; i<menuList.size(); i++) {
            String menu_list = menuList.get(i).getMenu_list();

         System.out.println(menu_list);
        Type type2 = new TypeToken<List<StoreBasketMenuRequestDTO>>(){}.getType();
          List<StoreBasketMenuRequestDTO> basket = gson.fromJson(menu_list, type2);





            for(int j =0; j<basket.size(); j++){
                basketMenu =storeBasketService.basketMenuListDtoToObject(basket);
         //  System.out.println(basketMenu.get(j).getMenu().getMenu_name());

           }

         System.out.println(basketMenu.get(0).getMenu().getMenu_name());
           // System.out.println(basketMenu.get(0).getMenu().getMenu_seq());
            //get에 1인덱스부터 배열크기가 안맞다고 오류남
        }




     model.addAttribute("basketMenu", basketMenu);

     model.addAttribute("menu_list", menuList);
        return "/member/order/ordersHistory";
    }
}
