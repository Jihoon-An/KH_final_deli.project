package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.dto.OrderOrdersDTO;
import kh.deli.domain.member.order.mapper.OrderOrdersMapper;
import kh.deli.global.entity.BoardDTO;
import kh.deli.global.entity.OrdersDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderOrdersService {

    @Autowired
    private OrderOrdersMapper orderOrdersMapper;


    public OrderOrdersDTO selectInitInfo(OrderOrdersDTO param) {
        return orderOrdersMapper.selectOrderMemberInfo(param);
    };

    public void updateMemberAddr(OrderOrdersDTO param) {
        orderOrdersMapper.updateMemberAddr(param);
    };


}
