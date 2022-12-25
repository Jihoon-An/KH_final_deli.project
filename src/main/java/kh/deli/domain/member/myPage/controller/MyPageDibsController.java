package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.dto.MyPageDibsDTO;
import kh.deli.domain.member.myPage.service.MyPageDibsService;
import kh.deli.global.entity.DibsDTO;
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
        int dibCount=list.size();

        model.addAttribute("list",list);
        model.addAttribute("dibCount",dibCount);

        return "/member/myPage/dibs";
    }

    @ResponseBody
    @PostMapping(value = "like")
    public int  insertDibs(int store_seq) throws Exception{
        
        System.out.println("컨트롤러 : "+" + "+store_seq);

        int acc_seq = (Integer) session.getAttribute("acc_seq");
        Integer result = myPageDibsService.isExistDibs(acc_seq,store_seq);
        System.out.println("결과 : "+result );
        if(result==0){
            System.out.println("추가");
            myPageDibsService.insertDibs(acc_seq,store_seq);
            return 1;
        }else {
            System.out.println("삭제");
            myPageDibsService.deleteDibs(acc_seq,store_seq);
            return 0;
        }
    }

}
