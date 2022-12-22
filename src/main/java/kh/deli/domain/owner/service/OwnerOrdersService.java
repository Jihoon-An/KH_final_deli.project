package kh.deli.domain.owner.service;

import kh.deli.domain.owner.mapper.OwnerOrdersMapper;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class OwnerOrdersService {

    private final OwnerOrdersMapper ordersMapper;

    public OrdersDTO findBySeq(int seq) {
        Optional<OrdersDTO> order = Optional.ofNullable(ordersMapper.findBySeq(seq));
        return order.orElse(new OrdersDTO());
    }
}
