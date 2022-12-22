package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.service.OwnerOrdersService;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@AllArgsConstructor
@RequestMapping("/owner/order")
public class OrderMngController {
    private final OwnerOrdersService ordersService;
    private final HttpSession session;

    @RequestMapping("")
    public String toPage(Model model) {

        Optional<Integer> ownerSeq = Optional.ofNullable((Integer) session.getAttribute("acc_seq"));
        List<OrdersDTO> orders = ordersService.getListByOwnerSeq(ownerSeq.orElse(0));

        model.addAttribute("order", orders);

        return "owner/orderMng";
    }
}
