package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.mapper.OrderMenuMapper;
import kh.deli.global.entity.MenuDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class OrderMenuService {

    private OrderMenuMapper menuMapper;

    public MenuDTO findBySeq(int seq) throws Exception {
        return menuMapper.findBySeq(seq);
    }
}
