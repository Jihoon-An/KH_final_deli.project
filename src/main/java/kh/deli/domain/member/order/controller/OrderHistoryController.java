package kh.deli.domain.member.order.controller;


import ch.qos.logback.core.net.SyslogOutputStream;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;
import kh.deli.domain.member.order.dto.OrderHistoryDTO;
import kh.deli.domain.member.order.service.OrderHistoryService;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
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

    @RequestMapping("history")
    public String history(Model model){



        int acc_seq=79;//임시
        List<OrderHistoryDTO> menuList= orderHistoryService.selectOrderHistory(acc_seq);


       

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




        model.addAttribute("list", menuList);
        return "/member/order/ordersHistory";
    }
}
