package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.service.MyPageReviewFormService;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.UUID;

@Controller
@RequestMapping("/memberReviewForm/")
public class MyPageReviewViewController {

    @Autowired
    private MyPageReviewFormService myPageReviewFormService;

    @Autowired
    private HttpSession session;

    @RequestMapping("toMemberReviewForm")
    public String toMemberMain(Model model) throws Exception {
        int order_seq=1; // 내 주문리스트에서 order_seq 파라미터로 가져오기
        OrdersDTO dto=myPageReviewFormService.selectByOrderSeq(order_seq);

        System.out.println(dto.getMenu_list());

        model.addAttribute("dto",dto);

        return "member/myPage/memberReviewForm";
    }

    @RequestMapping(value = "reviewInsert", method = RequestMethod.POST)
    public String reviewInsert(ReviewDTO dto, MultipartFile[] files) throws Exception {

        String realPath = session.getServletContext().getRealPath("/resources/img/review");
        File filePath = new File(realPath);

        if (!filePath.exists()) {
            filePath.mkdir();
        }

        JSONObject resultObj = new JSONObject();
        JSONArray componentArray = new JSONArray();

        if (!files[0].getOriginalFilename().equals("")) {
            for (MultipartFile file : files) {
                String sysName = UUID.randomUUID() + "_" + file.getOriginalFilename();
                file.transferTo(new File(filePath + "/" + sysName));
                resultObj.put("sysname", sysName);
                componentArray.add(resultObj);
            }
        }

        dto.setRev_sysname(componentArray.toJSONString());
        System.out.println(dto.getAcc_seq());
        myPageReviewFormService.reviewInsert(dto);

        return "redirect:/";
    }
}
