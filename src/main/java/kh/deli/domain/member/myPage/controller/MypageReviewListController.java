package kh.deli.domain.member.myPage.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.myPage.dto.MypageReviewDTO;
import kh.deli.domain.member.myPage.service.MyPageReviewService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/myPage/reviewList")
@AllArgsConstructor
public class MypageReviewListController {

    private final MyPageReviewService myPageReviewService;

    private final HttpSession session;

    @RequestMapping("")
//    public ModelAndView toOrders() throws  Exception{
        public String toMyPageReview(Model model) throws Exception{


        MypageReviewDTO param = new MypageReviewDTO();
        param.setAcc_seq(49);//사진 : 49, 메뉴리스트 : 31

        int myPageReivewCount = myPageReviewService.getReviewCount(param);

        List<MypageReviewDTO> myPageReviewList = new ArrayList<>();

        List<Map<String, Object>> reviewList = myPageReviewService.getReviews(param);


        for (int i = 0; i < reviewList.size(); i++) {
            String memNick = (String) reviewList.get(i).get("MEM_NICK");
            String revWriteTime = String.valueOf(reviewList.get(i).get("REV_WRITETIME"));
//            String revModifiedDate = String.valueOf(reviewList.get(i).get("REV_MODIFIED_DATE"));
            int revStar = Integer.parseInt(reviewList.get(i).get("REV_STAR").toString());
            String revSysName = (String) reviewList.get(i).get("REV_SYSNAME");
            String revContent = (String) reviewList.get(i).get("REV_CONTENT");
            String menuList = (String) reviewList.get(i).get("MENU_LIST");

            Gson gson = new Gson();

            Type type = new TypeToken<List<String>>() {}.getType();
            List<String> tmp1 = gson.fromJson(revSysName, type);
            List<String> tmp2 = gson.fromJson(menuList, type);

            myPageReviewList.add(MypageReviewDTO.builder().
                    mem_nick(memNick).
                    rev_writetime(revWriteTime).
//                    rev_modified_date(revModifiedDate).
                    rev_star(revStar).
                    rev_sysname(tmp1).
                    rev_content(revContent)
                    .menu_list(tmp2)
                    .build()
            );
        }

        model.addAttribute("myPageReviewCount", myPageReivewCount);
        model.addAttribute("myPageReviewList", myPageReviewList);

//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("/member/myPage/memberReviewList");
//        mav.addObject("reviewList", reviewList);
        return "/member/myPage/myPageReview";
    }


}
