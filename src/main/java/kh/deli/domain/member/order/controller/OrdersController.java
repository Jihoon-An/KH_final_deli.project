package kh.deli.domain.member.order.controller;

import kh.deli.domain.member.order.dto.OrderOrdersDTO;
import kh.deli.domain.member.order.service.OrderOrdersService;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/order/orders")
@AllArgsConstructor
public class OrdersController {

    private final HttpSession session;

    @Autowired
    OrderOrdersService orderOrdersService;

    private final OrderOrdersService ordersService;

    // 주문 페이지로 이동
    @RequestMapping("")
    public ModelAndView toOrders() throws  Exception{
        OrderOrdersDTO param = new OrderOrdersDTO();
        param.setSeq("39");
        OrderOrdersDTO userInfo = orderOrdersService.selectSessionInfo(param);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("/member/order/orders");
        mav.addObject("userInfo", userInfo);
        return mav;
    }


    @RequestMapping("selectInitInfo")
    @ResponseBody
    public OrderOrdersDTO selectInitInfo(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO){
        //String acc_email = (String)session.getAttribute("acc_email");

        return orderOrdersService.selectInitInfo(ordersDTO);
    }
    @RequestMapping("updateMemberAddr")
    @ResponseBody
    public void updateMemberAddr(OrderOrdersDTO ordersDTO){
        orderOrdersService.updateMemberAddr(ordersDTO);
    }

    @RequestMapping("updateMemberPhone")
    @ResponseBody
    public void updateMemberPhone(OrderOrdersDTO ordersDTO){orderOrdersService.updateMemberPhone(ordersDTO);}
    @RequestMapping("selectCouponList")
    @ResponseBody
    public List<OrderOrdersDTO> selectCouponList(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO){
        //String accSeq = (String)session.getAttribute("acc_seq");

        List<OrderOrdersDTO> a = orderOrdersService.selectCouponList(ordersDTO);

        return a;
    }

    @RequestMapping("insertPayment")
    @ResponseBody
    public void insertPayment (OrderOrdersDTO ordersDTO){orderOrdersService.insertPayment(ordersDTO);}


    @RequestMapping("insertOrders")
    @ResponseBody
    public void insertOrders(OrderOrdersDTO ordersDTO){orderOrdersService.insertOrders(ordersDTO);}

}
