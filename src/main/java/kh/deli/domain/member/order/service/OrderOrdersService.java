package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.dto.OrderOrdersDTO;
import kh.deli.domain.member.order.dto.OrdererInfoDTO;
import kh.deli.domain.member.order.dto.PayInfoDTO;
import kh.deli.domain.member.order.dto.StoreInfoDTO;
import kh.deli.domain.member.order.mapper.OrderOrdersMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class OrderOrdersService {

    @Autowired
    private OrderOrdersMapper orderOrdersMapper;


    public OrderOrdersDTO selectInitInfo(OrderOrdersDTO param) {
        return orderOrdersMapper.selectOrderMemberInfo(param);
    };

    public void updateMemberAddr(OrderOrdersDTO param) {
        orderOrdersMapper.updateMemberAddr(param);
    };


    public StoreInfoDTO storeInfo(int order_seq) throws Exception{
        return orderOrdersMapper.storeInfo(order_seq);
    }

    public OrdererInfoDTO ordererInfo(int order_seq) throws Exception{
        return orderOrdersMapper.ordererInfo(order_seq);
    }

    public PayInfoDTO payInfo(int order_seq) throws Exception{
        return orderOrdersMapper.payInfo(order_seq);
    }
}