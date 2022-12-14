package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.dto.MyPageDibsDTO;
import kh.deli.domain.member.myPage.service.MyPageDibsService;
import kh.deli.global.entity.DibsDTO;
import kh.deli.global.entity.StoreDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

//        List<Integer> intlist=new ArrayList<>();
//        for(int i=0;i<list.size();i++){
//            System.out.println(list.get(i).getSTORE_SEQ());
//            int store_seq=list.get(i).getSTORE_SEQ();
//            int value = myPageDibsService.selectStar(store_seq);
//            intlist.add(value);
//        }
//        model.addAttribute("intlist",intlist);

        model.addAttribute("list",list);
        return "/member/myPage/dibs";
    }

}
