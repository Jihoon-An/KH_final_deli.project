package kh.deli.domain.member.order.controller;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.order.dto.OrderHistoryDTO;
import kh.deli.domain.member.order.service.OrderHistoryService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
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



        int acc_seq=31;//임시
        List<OrderHistoryDTO> list = orderHistoryService.selectOrderHistory(acc_seq);

//        //식당 영업시간
//        Map<String, Object> storeBsnsHours = new HashMap<>();
//        String bsnsHours = String.valueOf(store.getStore_bsns_hours());
//        System.out.println(bsnsHours);

       Gson gson = new Gson();
//        Type type = new TypeToken<Map<String,Map<String,Object>>>() {
//        }.getType();
//        Map<String,Map<String,Object>> parsingStr = gson.fromJson(bsnsHours, type);
//        System.out.println(parsingStr);
        //int acc_seq = (Integer) session.getAttribute("acc_seq"); //사용자 세션


//        Type listString = new TypeToken<List<Map<String,Map<String,Object>>>>() {
//        }.getType();
//        List<Map<String,Map<String,Object>>> menuList = gson.fromJson(list.get(), listString);
//

        model.addAttribute("list", list);
        return "/member/order/ordersHistory";
    }
}
