package kh.deli.domain.member.order.controller;


import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.order.dto.OrderHistoryDTO;
import kh.deli.domain.member.order.service.OrderHistoryService;
import lombok.AllArgsConstructor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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

        for(int i = 0; i< list.size() ; i++) {
            String str = list.get(i).getMenu_list();

            JsonParser Parser = new JsonParser();
            JsonObject jsonObj = (JsonObject) Parser.parse(str);
            JsonArray memberArray = (JsonArray) jsonObj.get("menuList");

            for (int n = 0; n < memberArray.size(); n++) {
                JsonObject object = (JsonObject) memberArray.get(n);
                JsonElement menu_name = object.get("menu");
                String menuname = menu_name.toString();
                JsonObject jsonObj2 = (JsonObject) Parser.parse(menuname);
                System.out.println("menu_name : " + jsonObj2.get("menu_name"));
            }
            // 역직렬화 ? Map = {"menu_name" : "화이트갈릭치즈버거"}
        }

//        Gson gson = new Gson();
//        Type listString = new TypeToken<List<Map<String,Map<String,Object>>>>() {
//        }.getType();
//        List<Map<String,Map<String,Object>>> menuList = gson.fromJson(list.get(), listString);

        model.addAttribute("list", list);
        return "/member/order/ordersHistory";
    }
}
