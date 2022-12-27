package kh.deli.domain.member.order.controller;

import com.google.gson.Gson;
import kh.deli.domain.member.order.dto.OrderOrdersDTO;
import kh.deli.domain.member.order.service.OrderOrdersService;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/order/orders")
@AllArgsConstructor
public class OrdersController {

    private final HttpSession session;

    @Autowired
    OrderOrdersService orderOrdersService;
    @Autowired
    StoreStoreService storeStoreService;

    private final OrderOrdersService ordersService;

    // 주문 페이지로 이동
    @RequestMapping("")
    public ModelAndView toOrders() throws  Exception{


        String email = (String)session.getAttribute("loginEmail");
//        System.out.println(email);
        OrderOrdersDTO orderOrdersDTO = new OrderOrdersDTO();
//        orderOrdersDTO.setOrder_price((Integer) session.getAttribute("order_price"));
//        orderOrdersDTO.setOrder_price(10000); // 이거 세션에 있는 값 넣어서 넘기기
//        param.setSeq("39");

//        OrderOrdersDTO userInfo = orderOrdersService.selectSessionInfo(param);



        ModelAndView mav = new ModelAndView();
        mav.setViewName("/member/order/orders");
        mav.addObject("orderOrdersDTO", orderOrdersDTO);
//        mav.addObject("userInfo", userInfo);
        return mav;
    }

    @RequestMapping("selectInitInfo")
    @ResponseBody
    public OrderOrdersDTO selectInitInfo(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO) throws Exception {
        OrderOrdersDTO result = orderOrdersService.selectInitInfo(ordersDTO);
        BasketDTO basketDTO = (BasketDTO) session.getAttribute("basket");
        int storeSeq = basketDTO.getStoreSeq();
        StoreDTO storeDTO = storeStoreService.getStoreInfo(storeSeq);
        int tip = storeDTO.getStore_deli_tip();
        result.setDelivery_tip(tip);

        return result;
    }
    @RequestMapping("updateMemberAddr")
    @ResponseBody
    public void updateMemberAddr(OrderOrdersDTO ordersDTO){
        orderOrdersService.updateMemberAddr(ordersDTO);
    }

    @RequestMapping("updateMemberPhone")
    @ResponseBody
    public int updateMemberPhone(OrderOrdersDTO ordersDTO){
        int result = orderOrdersService.updateMemberPhone(ordersDTO);
        return result;
    }
    @RequestMapping("selectCouponList")
    @ResponseBody
    public List<OrderOrdersDTO> selectCouponList(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO){
        //String accSeq = (String)session.getAttribute("acc_seq");

        List<OrderOrdersDTO> a = orderOrdersService.selectCouponList(ordersDTO);

        return a;
    }


    @RequestMapping("insertOrder")
    @ResponseBody
    public ModelAndView saveOrder(OrderOrdersDTO orderOrdersDTO) throws Exception {

        BasketDTO basketDTO = (BasketDTO) session.getAttribute("basketDTO");
        int storeSeq = basketDTO.getStoreSeq();
        int accSeq = (int) session.getAttribute("acc_seq");
        List<StoreBasketMenuRequestDTO> manuList = basketDTO.getMenuList();
        Gson gson = new Gson();
        String manuListStr = gson.toJson(manuList);
        orderOrdersDTO.setMenuList(manuListStr);
        StoreDTO storeDTO = storeStoreService.getStoreInfo(storeSeq);
        int tip = storeDTO.getStore_deli_tip();
        orderOrdersDTO.setDelivery_tip(tip);


        // temp code start
//        StoreDTO storeDTO = storeStoreService.getStoreInfo(21);
//        int tip = storeDTO.getStore_deli_tip();
//        orderOrdersDTO.setDelivery_tip(tip);
//        List<StoreBasketMenuRequestDTO> list = new ArrayList<>();
//        StoreBasketMenuRequestDTO temp = new StoreBasketMenuRequestDTO();
//        temp.setCount(1);
//        temp.setPrice(1);
//        temp.setOptionSeqList(new ArrayList<>());
//        temp.setMenuSeq(1);
//        temp.setStoreSeq(1);
//        list.add(temp);
//
//        temp = new StoreBasketMenuRequestDTO();
//        temp.setCount(2);
//        temp.setPrice(2);
//        temp.setOptionSeqList(new ArrayList<>());
//        temp.setMenuSeq(2);
//        temp.setStoreSeq(2);
//        list.add(temp);
//
//        Gson gson = new Gson();
//        String menuList = gson.toJson(list);
//        orderOrdersDTO.setAcc_seq("39");
//        orderOrdersDTO.setStore_seq(21);
//        orderOrdersDTO.setMenuList(menuList);
        // temp code end

        orderOrdersService.insertOrder(orderOrdersDTO);
        orderOrdersService.deleteCouponList(orderOrdersDTO);



        //보유포인트 차감 & 적립
        int orgPoint = Integer.parseInt(orderOrdersDTO.getOwnPoint());
        int ordPrice = orderOrdersDTO.getOrder_price();
        int usePoint = orderOrdersDTO.getUsePoint();
        int savePoint = (int) Math.round(ordPrice * 0.01);
        int ownPoint = orgPoint - usePoint + savePoint;

        orderOrdersDTO.setOwnPoint(String.valueOf(ownPoint));
        orderOrdersService.updateOwnPoint(orderOrdersDTO);


        ModelAndView mav = new ModelAndView();
        mav.setViewName("/member/order/orderDetail");
        mav.addObject("orderOrdersDTO", orderOrdersDTO);

        return mav;

    }


}
