package kh.deli.domain.owner.service;

import kh.deli.domain.owner.dto.OwnerOrderMngRequestDTO;
import kh.deli.domain.owner.mapper.OwnerOrdersMapper;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class OwnerOrdersService {

    private final OwnerOrdersMapper ordersMapper;

    public OrdersDTO findBySeq(int seq) {
        Optional<OrdersDTO> order = Optional.ofNullable(ordersMapper.findBySeq(seq));
        return order.orElse(new OrdersDTO());
    }

    public List<OrdersDTO> getListByStoreSeq(Integer ownerAccSeq) {
        Optional<List<OrdersDTO>> orders = Optional.ofNullable(ordersMapper.getListByStoreSeq(ownerAccSeq));
        return orders.orElse(new ArrayList<>());
    }

    public List<OwnerOrderMngRequestDTO> getOrderMngList(int storeSeq) {
        Optional<List<OwnerOrderMngRequestDTO>> orderMngList
                = Optional.ofNullable(ordersMapper.getOrderMngList(storeSeq));
        return orderMngList.orElse(new ArrayList<>());
    }
}
