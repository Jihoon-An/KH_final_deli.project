package kh.deli.domain.member.myPage.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.myPage.dto.MypageReviewDTO;
import kh.deli.domain.member.myPage.service.MyPageReviewService;
import kh.deli.domain.member.order.dto.OrderDetailDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import lombok.AllArgsConstructor;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.lang.reflect.Type;
import java.util.*;

@Controller
@RequestMapping("/myPage/reviewList")
@AllArgsConstructor
public class MypageReviewListController {
    private final OrderBasketService orderBasketService;
    private final MyPageReviewService myPageReviewService;

    private final HttpSession session;

    @RequestMapping("")

        public String toMyPageReview(Model model) throws Exception{

        ObjectMapper mapper = new ObjectMapper();
        MypageReviewDTO param = new MypageReviewDTO();
        param.setAcc_seq(79);//사진 : 49, 메뉴리스트 : 31

        int myPageReivewCount = myPageReviewService.getReviewCount(param);
        System.out.println("리뷰 갯수 >>>> " + myPageReivewCount);
        List<MypageReviewDTO> myPageReviewList = new ArrayList<>();

        List<Map<String, Object>> reviewList = myPageReviewService.getReviews(param);


        for (int i = 0; i < reviewList.size(); i++) {
            String memNick = (String) reviewList.get(i).get("MEM_NICK");
            String revWriteTime = String.valueOf(reviewList.get(i).get("REV_WRITETIME"));
            int rev_seq = Integer.parseInt(String.valueOf(reviewList.get(i).get("REV_SEQ")));
            String flag_udt = (String) reviewList.get(i).get("FLAG_UDT");
            String storeName = (String) reviewList.get(i).get("STORE_NAME");
            int revStar = Integer.parseInt(reviewList.get(i).get("REV_STAR").toString());
            String revSysName = (String) reviewList.get(i).get("REV_SYSNAME");
            String revContent = (String) reviewList.get(i).get("REV_CONTENT");
            String strMenuList = (String) reviewList.get(i).get("MENU_LIST");

            ArrayList<HashMap<String, Object>> menuList = new ArrayList<HashMap<String,Object>>();
            menuList = mapper.readValue(strMenuList, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

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
            Type type = new TypeToken<List<String>>() {}.getType();
            List<String> tmp1 = gson.fromJson(revSysName, type);

            myPageReviewList.add(MypageReviewDTO.builder().
                    mem_nick(memNick).
                    rev_writetime(revWriteTime).
                    rev_star(revStar).
                    rev_sysname(tmp1).
                    rev_content(revContent)
                            .rev_seq(rev_seq)
                            .flag_udt(flag_udt)
                    .menu(menu)
                    .store_name(storeName)
                    .build()
            );
        }

        model.addAttribute("reviewList", reviewList);
        model.addAttribute("myPageReviewCount", myPageReivewCount);
        model.addAttribute("myPageReviewList", myPageReviewList);
        return "/member/myPage/memberReviewList";
    }

    //@RequestMapping("deleteReview")




}
