package kh.deli.domain.member.userMenu.controller;

import kh.deli.domain.main.dto.MemberMainRequestDTO;
import kh.deli.domain.member.userMenu.service.MemberReviewFormService;
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
public class MemberReviewFormController {

    @Autowired
    private MemberReviewFormService memberReviewFormService;

    @Autowired
    private HttpSession session;

    @RequestMapping("toMemberReviewForm")
    public String toMemberMain(Model model) throws Exception {
        //주문내역 가져오기
        int order_seq=1;
        OrdersDTO dto=memberReviewFormService.selectByOrderSeq(order_seq);
        return "member/userMenu/memberReviewForm";
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

        memberReviewFormService.reviewInsert(dto);

        return "redirect:/memberMain/toMemberMain";
    }
}
