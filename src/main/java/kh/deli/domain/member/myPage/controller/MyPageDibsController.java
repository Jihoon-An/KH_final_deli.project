package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.dto.MyPageDibsDTO;
import kh.deli.domain.member.myPage.service.MyPageDibsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/myPage/dibs/")
public class MyPageDibsController {

    @Autowired
    private HttpSession session;

    @Autowired
    private MyPageDibsService myPageDibsService;

    @RequestMapping("")
    public String toMyDibs(Model model) throws Exception {

        int acc_seq = (Integer) session.getAttribute("acc_seq");

        List<MyPageDibsDTO> list = myPageDibsService.select(acc_seq);
        int dibCount = list.size();

        model.addAttribute("list", list);
        model.addAttribute("dibCount", dibCount);

        return "/member/myPage/dibs";
    }

    @ResponseBody
    @PostMapping(value = "like")
    public int insertDibs(Integer store_seq) throws Exception {
        int acc_seq = (Integer) session.getAttribute("acc_seq");
        Integer result = myPageDibsService.isExistDibs(acc_seq, store_seq);
        if (result == 0) {
            myPageDibsService.insertDibs(acc_seq, store_seq);
            return 1;
        } else {
            myPageDibsService.deleteDibs(acc_seq, store_seq);
            return 0;
        }
    }

}
