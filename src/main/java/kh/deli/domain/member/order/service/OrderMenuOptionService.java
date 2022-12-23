package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.mapper.OrderMenuOptionMapper;
import kh.deli.global.entity.MenuOptionDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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

    public List<MenuOptionDTO> seqListToObject(String seqListStr) {
        Optional<List<MenuOptionDTO>> menuOptionList = Optional.ofNullable(optionMapper.getListBySeq(seqListStr));
        return menuOptionList.orElse(new ArrayList<>());
    }
}
