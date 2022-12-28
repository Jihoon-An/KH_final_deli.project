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
        List<OrderHistoryDTO> orderList= orderHistoryService.selectOrderHistory(acc_seq);

        List<BasketMenu> menuList = new ArrayList<>();
        List<Integer> menuCountList = new ArrayList<>();

       // List<BasketMenu> menuList = new ArrayList<>();
        for(int i = 0; i<orderList.size(); i++) {
            String getMenuList = orderList.get(i).getMenu_list();

            //System.out.println(getMenuList);
            Type type2 = new TypeToken<List<StoreBasketMenuRequestDTO>>(){}.getType();
            List<StoreBasketMenuRequestDTO> parseMenuList = gson.fromJson(getMenuList, type2);





            // parseMenuList는 seq가 담긴 seq 리스트,  아래 basketMenuListDToObject메서드로  name으로 전환
            List<BasketMenu> menuListName =storeBasketService.basketMenuListDtoToObject(parseMenuList);
            //basketMenuListDtoToObject 의 반환타입이 List<BasketMenu>
//            System.out.println(menuList2);

                BasketMenu MenuName= menuListName.get(0);
            //System.out.println(menuList2.size());
                int menuCount = menuListName.size();


               // 여기까진 0인덱스메뉴명밖에 출력을 못함


                //for문 안에 있어야 하는 이유 orderList길이만큼 for문 돌려서서 add



               //  System.out.println(basketMenu.get(j).getMenu().getMenu_name());


           // System.out.println(menuList.get(0).getMenu().getMenu_name());
            // System.out.println(basketMenu.get(0).getMenu().getMenu_seq());
            //get에 1인덱스부터 배열크기가 안맞다고 오류남
            menuList.add(MenuName);
            menuCountList.add(menuCount);
        }

        menuCountList.get(0).intValue();

        model.addAttribute("menu_count_list", menuCountList); //메뉴 갯수
        model.addAttribute("menu_list", menuList); // parse한 리스트

        model.addAttribute("order_list", orderList);  //join 되어 있는 list
        return "/member/order/ordersHistory";
    }
}
