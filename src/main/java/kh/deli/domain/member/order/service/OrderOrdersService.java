package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.mapper.OrderOrdersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderOrdersService {

    @Autowired
    private OrderOrdersMapper orderOrdersMapper;
}
