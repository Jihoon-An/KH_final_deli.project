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
        List<OrderHistoryDTO> orderList= orderHistoryService.selectOrderHistory(acc_seq);

        List<BasketMenu> menuList = new ArrayList<>();
        List<Integer> menuCountList = new ArrayList<>();
//        List<MenuOptionDTO> menuOptionList = new ArrayList<>();


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



        // MenuOptionDTO MenuOption=  menuListName.get(0).getOptionList().get(0);
            //get에 1인덱스부터 배열크기가 안맞다고 오류남

            //menuOptionList.add(MenuOption);
            menuList.add(MenuName);
            menuCountList.add(menuCount);
        }

       // model.addAttribute("menu_option", menuOptionList);
        model.addAttribute("menu_count_list", menuCountList); //메뉴 갯수
        model.addAttribute("menu_list", menuList); // parse한 리스트
        model.addAttribute("order_list", orderList);  //join 되어 있는 list
        return "/member/order/ordersHistory";
    }


//    @RequestMapping("{orderSeq}")
//    public String reOrder(@PathVariable("orderSeq")Integer order_seq) throws Exception {
//        System.out.println("오더seq"+order_seq);
//
//        OrdersDTO ordersDTO = orderOrdersService.findOrdersBySeq(order_seq);
//       String menu_list = ordersDTO.getMenu_list();
//
//
//
////               for(int i = 0; i<ordersDTO.getMenu_list().length(); i++){
////                   ordersDTO.getMenu_list(i);
////               }
//
//       JSONParser jsonParser = new JSONParser();
//        JSONArray jsonArr = (JSONArray) jsonParser.parse(ordersDTO.getMenu_list());
//
//            List<String> menuNameList  = new ArrayList<>();
//
//        if (jsonArr.size() > 0) {
//
//            for (Integer i = 0; i < jsonArr.size(); i++) {
//                JSONObject jsonObj = (JSONObject) jsonArr.get(i);
//              String storeSeq = jsonObj.get("storeSeq").toString();
//                String menuSeq = jsonObj.get("menuSeq").toString();
//                String optionSeqList = jsonObj.get("optionSeqList").toString();
//                String count = jsonObj.get("count").toString();
//                String price = jsonObj.get("price").toString();
//
//                menuNameList.add(storeSeq);
//                menuNameList.add(menuSeq);
//                menuNameList.add(optionSeqList);
//                menuNameList.add(count);
//                menuNameList.add(price);
//          }
//        }
//
////        StoreBasketMenuRequestDTO s= new StoreBasketMenuRequestDTO(menuNameList.get(0),menuNameList.get(1),menuNameList.get(2), menuNameList.get(3), menuNameList.get(4));
////
//        for(int i = 0; i<menuNameList.size(); i++){
//
//            storeBasketService.setBasketInSession(session, menuNameList.get(0) );
//       }
//
//        storeBasketService.setBasketInSession(session, jsonArr.toJSONString() );
//        //ystem.out.println(menuString);
////        Menu[] menu;
////
////        List<Menu> menuList = Arrays.asList(ObjectMapper.readValue(menu_list, menu.class));
////        //리스트를 풀어서
//
////        Type type2 = new TypeToken<List<StoreBasketMenuRequestDTO>>(){}.getType();
////        List<StoreBasketMenuRequestDTO> basket = gson.fromJson(menu_list, type2);
//
//
//        //List<BasketMenu> basketMenu = storeBasketService.basketMenuListDtoToObject(basket);
//
//    //    List<BasketMenu> basketMenu = storeBasketService.basketMenuListDtoToObject(basket);
////        basketMenu.get(0).getMenu().
//
//       // basketMenu.get().
//
//    //
//        // System.out.println(storeSeq);
//
//        return "redirect:/basket";
//    }



    @RequestMapping("/{orderSeq}")
    public String reOrder(@PathVariable("orderSeq")Integer order_seq) throws Exception {
        session.removeAttribute("basket");
        //가게 시퀸스 다르게 담아오면 오류라서 세션 삭제 후 진행
        OrdersDTO ordersDTO = orderOrdersService.findOrdersBySeq(order_seq);

        int storeSeq = ordersDTO.getStore_seq();
        int orderPrice = ordersDTO.getOrder_price();
        String menuListStr = ordersDTO.getMenu_list();
        //BasketDTO 매개변수 타입에 맞게끔

        Gson gson = new Gson();
        Type type = new TypeToken<List<StoreBasketMenuRequestDTO>>(){}.getType();
        List<StoreBasketMenuRequestDTO> basketList = gson.fromJson(menuListStr, type);
        BasketDTO basket = new BasketDTO(storeSeq,basketList,orderPrice);

        session.setAttribute("basket", basket);

        return "redirect:/basket";
    }







    @ResponseBody
    @RequestMapping("reviewChk")
    public boolean isExistReview(int order_seq){
       boolean result=  orderHistoryService.isExistReivew(order_seq);

        System.out.println(result+"리뷰체킹");
        return result;
    }
}
