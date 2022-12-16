package kh.deli.domain.member.store.service;

import kh.deli.domain.member.store.mapper.StoreSearchMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class StoreSearchService {

    private final StoreSearchMapper storeSearchMapper;
    public List<Map<String, Object>> selectDistanceByAccSeq(int acc_seq) {
        return storeSearchMapper.selectDistanceByAccSeq(acc_seq);
    }

}
