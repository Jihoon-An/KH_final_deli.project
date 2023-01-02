package kh.deli.domain.member.myPage.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.myPage.dto.MypageReviewDTO;
import kh.deli.domain.member.myPage.service.MyPageReviewService;
import kh.deli.domain.member.order.dto.OrderDetailDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/myPage/reviewList")
@AllArgsConstructor
public class MypageReviewListController {
    private final OrderBasketService orderBasketService;
    private final MyPageReviewService myPageReviewService;

    private final HttpSession session;

    @RequestMapping("")

    public String toMyPageReview(Model model) throws Exception {



        int accSeq = (int) session.getAttribute("acc_seq");


        ObjectMapper mapper = new ObjectMapper();
        MypageReviewDTO param = new MypageReviewDTO();

        param.setAcc_seq(accSeq);

        int myPageReivewCount = myPageReviewService.getReviewCount(param);
        System.out.println("리뷰 갯수 >>>> " + myPageReivewCount);
        List<MypageReviewDTO> myPageReviewList = new ArrayList<>();

        List<Map<String, Object>> reviewList = myPageReviewService.getReviews(param);
//나경
        //OrdersDTO orders_dto = myPageReviewService.selectByOrderSeq(18);

        //JSONParser jsonParser = new JSONParser();
        //JSONArray jsonArr = (JSONArray) jsonParser.parse(orders_dto.getMenu_list()); //파싱한 다음 jsonobject로 변환

//        List<String> menuNameList = new ArrayList<>();
//
//        if (jsonArr.size() > 0) {
//
//            for (Integer i = 0; i < jsonArr.size(); i++) {
//                JSONObject jsonObj = (JSONObject) jsonArr.get(i);
//                String menuSeq = jsonObj.get("menuSeq").toString();
//                String menuName = myPageReviewService.selectMenuName(menuSeq);
//                menuNameList.add(menuName);
//            }
//        }


        for (int i = 0; i < reviewList.size(); i++) {
            String memNick = (String) reviewList.get(i).get("MEM_NICK");
            String revWriteTime = String.valueOf(reviewList.get(i).get("REV_WRITETIME"));
            int rev_seq = Integer.parseInt(String.valueOf(reviewList.get(i).get("REV_SEQ")));
            int order_seq = Integer.parseInt(String.valueOf(reviewList.get(i).get("ORDER_SEQ")));
            int store_seq = Integer.parseInt(String.valueOf(reviewList.get(i).get("STORE_SEQ")));
            String flag_udt = (String) reviewList.get(i).get("FLAG_UDT");
            String storeName = (String) reviewList.get(i).get("STORE_NAME");
            int revStar = Integer.parseInt(reviewList.get(i).get("REV_STAR").toString());
            String revSysName = (String) reviewList.get(i).get("REV_SYSNAME");
            String revContent = (String) reviewList.get(i).get("REV_CONTENT");
            String strMenuList = (String) reviewList.get(i).get("MENU_LIST");

            ArrayList<HashMap<String, Object>> menuList = new ArrayList<HashMap<String, Object>>();
            menuList = mapper.readValue(strMenuList, new TypeReference<ArrayList<HashMap<String, Object>>>() {
            });

            List<OrderDetailDTO> menu = new ArrayList<>();
            for (int j = 0; menuList.size() > j; j++) {
                HashMap<String, Object> seq = menuList.get(j);
                int menuSeq = (int) seq.get("menuSeq");
                ArrayList<Integer> optionCnt = (ArrayList<Integer>) seq.get("optionSeqList");
                MenuDTO menuDTO = orderBasketService.findMenuBySeq(menuSeq);
                List<MenuOptionDTO> menuOptionDTOList = new ArrayList<>();
                for (int k = 0; optionCnt.size() > k; k++) {
                    MenuOptionDTO menuOptionDTO = orderBasketService.findMenuOptionBySeq(optionCnt.get(k));
                    menuOptionDTOList.add(menuOptionDTO);
                }
                int count = (int) seq.get("count");
                int price = (int) seq.get("price");
                OrderDetailDTO orderDetailDTO = new OrderDetailDTO(menuDTO, menuOptionDTOList, count, price);
                menu.add(orderDetailDTO);
            }

            Gson gson = new Gson();
            Type type = new TypeToken<List<String>>() {
            }.getType();
            List<String> tmp1 = gson.fromJson(revSysName, type);

            myPageReviewList.add(MypageReviewDTO.builder().
                    mem_nick(memNick).
                    rev_writetime(revWriteTime).
                    rev_star(revStar).
                    rev_sysname(tmp1).
                    rev_content(revContent).
                    rev_seq(rev_seq).
                    store_seq(store_seq).
                    order_seq(order_seq).
                    flag_udt(flag_udt).
                    menu(menu).
                    store_name(storeName).
                    build()

            );

        }

        model.addAttribute("reviewList", reviewList);
        model.addAttribute("myPageReviewCount", myPageReivewCount);
        model.addAttribute("myPageReviewList", myPageReviewList);
        return "/member/myPage/memberReviewList";
    }

    @RequestMapping("deleteReview")

    public String deleteReview(int rev_seq) throws Exception{
        myPageReviewService.deleteReview(rev_seq);

        return "redirect:/";
    }

}
