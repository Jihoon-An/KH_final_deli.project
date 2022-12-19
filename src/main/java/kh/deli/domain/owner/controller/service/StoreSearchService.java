package kh.deli.domain.owner.controller.service;

import kh.deli.domain.member.store.mapper.StoreSearchMapper;
import kh.deli.global.entity.MenuDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class StoreSearchService {

    private final StoreSearchMapper storeSearchMapper;
    public List<Map<String, Object>> selectDistanceByAccSeq(int acc_seq, String search) {
        return storeSearchMapper.selectDistanceByAccSeq(acc_seq, search);
    }
    public List<MenuDTO> selectMenuListByStoreSeq(int store_seq) {
        return storeSearchMapper.selectMenuListByStoreSeq(store_seq);
    }

}
