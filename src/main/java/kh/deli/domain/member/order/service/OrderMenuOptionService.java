package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.mapper.OrderMenuOptionMapper;
import kh.deli.global.entity.MenuOptionDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class OrderMenuOptionService {
    private final OrderMenuOptionMapper optionMapper;

    public MenuOptionDTO findBySeq(int seq) throws Exception {
        return optionMapper.findBySeq(seq);
    }

    public List<MenuOptionDTO> findByMenuSeq(int menuSeq) {
        return optionMapper.findByMenuSeq(menuSeq);
    }
}
