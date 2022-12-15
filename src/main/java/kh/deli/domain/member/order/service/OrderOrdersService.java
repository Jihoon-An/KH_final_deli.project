package kh.deli.domain.member.order.service;


import kh.deli.domain.member.order.dto.OrdererInfoDTO;
import kh.deli.domain.member.order.dto.PayInfoDTO;
import kh.deli.domain.member.order.dto.StoreInfoDTO;
import kh.deli.domain.member.order.mapper.OrderOrdersMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class OrderOrdersService {

    private OrderOrdersMapper orderOrdersMapper;

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
