package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.mapper.OrderStoreMapper;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class OrderStoreService {
    private final OrderStoreMapper storeMapper;

    public StoreDTO findBySeq(int seq) throws Exception {
        return storeMapper.findBySeq(seq);
    }
}
