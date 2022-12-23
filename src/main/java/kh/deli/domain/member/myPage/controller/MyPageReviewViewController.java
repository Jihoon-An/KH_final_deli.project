package kh.deli.domain.member.myPage.controller;


import kh.deli.domain.member.myPage.service.MyPageReviewService;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import lombok.AllArgsConstructor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/myPage/reviewWrite/")
@AllArgsConstructor
public class MyPageReviewViewController {

    private final MyPageReviewService myPageReviewService;
    private final HttpSession session;

    @RequestMapping("")
    public String toMemberMain(int order_seq,Model model) throws Exception {
        //int order_seq = 18; // 내 주문리스트에서 order_seq 파라미터로 가져오기
        OrdersDTO dto = myPageReviewService.selectByOrderSeq(order_seq);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject =(JSONObject)jsonParser.parse(dto.getMenu_list()); //파싱한 다음 jsonobject로 변환

        JSONArray jsonArr = (JSONArray) jsonObject.get("menuList"); //menuListarray를 jsonarray에 저장

        List<String> menuNameList=new ArrayList<>();

        if (jsonArr.size() > 0) {

            for (int i = 0; i < jsonArr.size(); i++) {

                JSONObject jsonObj = (JSONObject)jsonArr.get(i);
                String menuSeq= jsonObj.get("menuSeq").toString();
                String menuName=myPageReviewService.selectMenuName(menuSeq);
                menuNameList.add(menuName);

            }
        }

        model.addAttribute("dto", dto);
        model.addAttribute("menuNameList",menuNameList);

        return "/member/myPage/memberReview";
    }

    @PostMapping("reviewInsert")
    public String reviewInsert(ReviewDTO dto, MultipartFile[] files) throws Exception {

        myPageReviewService.reviewInsert(session, dto, files);

        return "redirect:/";
    }

}