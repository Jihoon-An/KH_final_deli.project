package kh.deli.domain.member.order.controller;


import kh.deli.domain.member.order.dto.OrderHistoryDTO;
import kh.deli.domain.member.order.service.OrderHistoryService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

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

        //int acc_seq = (Integer) session.getAttribute("acc_seq"); //사용자 세션
        int acc_seq=39;//임시
        List<OrderHistoryDTO> list = orderHistoryService.selectOrderHistory(acc_seq);

       model.addAttribute("list", list);
        return "/member/order/ordersHistory";
    }
}
