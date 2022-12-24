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


        int acc_seq=31;//임시
        List<OrderHistoryDTO> menuList= orderHistoryService.selectOrderHistory(acc_seq);


        for(int i =0; i<menuList.size(); i++){
         String s=   menuList.get(i).getMenu_list();
            storeBasketService.basketMenuListDtoToObject()
        }





//        BasketDTO basket = new BasketDTO();
//        for(int i = 0; i<menuList.size(); i++) {
//            String menu_list = menuList.get(i).getMenu_list();
//             basket = gson.fromJson(menu_list, BasketDTO.class);
//        }



//        List<OrderDetailDTO> orderDetailDTOList = new ArrayList<>();
//
//        for(int i = 0; i< basket.getMenuList().size(); i++){
//            MenuDTO menuDTO = orderBasketService.findMenuBySeq(basket.getMenuList().get(i).getMenuSeq());
//            List<MenuOptionDTO> menuOptionDTOList = new ArrayList<>();
////            for (int k = 0; basket.getMenuList().get(i).getOptionSeqList().size() > k; k++) {
////                MenuOptionDTO menuOptionDTO = orderBasketService.findMenuOptionBySeq(basket.getMenuList().get(i).getOptionSeqList().get(k));
////                menuOptionDTOList.add(menuOptionDTO);
////            }
//            int count = basket.getMenuList().get(i).getCount();
//            int price = basket.getMenuList().get(i).getPrice();
//
////            System.out.println(menuDTO.getMenu_name());
////            System.out.println(menuDTO.getMenu_price());
////            System.out.println(count);
//
//            OrderDetailDTO orderDetailDTO = new OrderDetailDTO(menuDTO, menuOptionDTOList, count, price);
//
//            orderDetailDTOList.add(orderDetailDTO);
//        }
//
        /////////////////////

        //        for(int i = 0; i< basket.getMenuList().size(); i++){
//            MenuDTO menuDTO = orderBasketService.findMenuBySeq(basket.getMenuList().get(i).getMenuSeq());
//
//            int count =basket.getMenuList().get(i).getCount();
//            int price =basket.getMenuList().get(i).getPrice();
//        }


//        // 다시
//        List<OrdersDTO> ordersDTO = orderHistoryService.findOrdersByAccSeq(acc_seq);
//
//        BasketDTO basket = new BasketDTO();
//
//        for(int i = 0; i<ordersDTO.size(); i++) {
//            String menu_list = ordersDTO.get(i).getMenu_list();
//             basket = gson.fromJson(menu_list, BasketDTO.class);
//        }


/////////////////////////




            //        int acc_seq=31;//임시
//        List<OrderHistoryDTO> list = orderHistoryService.selectOrderHistory(acc_seq);
//
//        for(int i = 0; i< list.size() ; i++) {
//            String str = list.get(i).getMenu_list();
//
//            JsonParser Parser = new JsonParser();
//            JsonObject jsonObj = (JsonObject) Parser.parse(str);
//            JsonArray memberArray = (JsonArray) jsonObj.get("menuList");
//
//
//            for (int n = 0; n < memberArray.size(); n++) {
//                JsonObject object = (JsonObject) memberArray.get(n);
//                JsonElement menu_name = object.get("menu");
//                String menuname = menu_name.toString();
//                JsonObject jsonObj2 = (JsonObject) Parser.parse(menuname);
//                System.out.println("menu_name : " + jsonObj2.get("menu_name"));
//            }
//            // 역직렬화 ? Map = {"menu_name" : "화이트갈릭치즈버거"}
//        }
//
//

            //Gson gson = new Gson();

//        JsonParser parser = new JsonParser();
//        for(int i = 0; i<menuList.size();i++) {
//            JsonArray jsonArray = (JsonArray) parser.parse(menuList.get(i).getMenu_list());
//            System.out.println(jsonArray);
//        }

       // Map<String, Object> storeBsnsHours = new HashMap<>();
//        String menu="";
//        for(int i = 0; i<menuList.size(); i++){
//            menu = String.valueOf(menuList.get(i).getMenu_list());
//
//        }
//
//        System.out.println(menu);
//
//
//        Type type = new TypeToken<List<Map<String,Object>>>() {
//        }.getType();
//
//            List<Map<String,Map<String,Object>>> parseMenuList = gson.fromJson(menu, type);
//
//            System.out.println(parseMenuList);

//        Gson gson = new Gson();
//        Type listString = new TypeToken<List<Map<String,Map<String,Object>>>>() {
//        }.getType();
//        List<Map<String,Map<String,Object>>> menuList = gson.fromJson(list.get(), listString);


//        int acc_seq = (Integer) session.getAttribute("acc_seq"); //사용자 세션


//        Type listString = new TypeToken<Map<String,Map<String,Object>>>() {
//        }.getType();
//        Map<String,Map<String,Object>> menuList = gson.fromJson(menuL, listString);
//
//    for(int i =0; i<list.size(); i++) {
//        System.out.println(list.get(i).getMenu_list());
//        System.out.println(list.get(i).getAcc_seq());
//    }

//        for(int i =0; i<menuList.size(); i++) {
//            System.out.println(menuList.get(i).getMenu_list());
//        }
//        System.out.println(menuList.get(0).getMenu_list());



        model.addAttribute("orderDetailDTOList", orderDetailDTOList);
        model.addAttribute("list", menuList);
        return "/member/order/ordersHistory";
    }
}
