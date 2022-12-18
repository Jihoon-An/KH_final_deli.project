package kh.deli.domain.member.store.service;

import kh.deli.domain.member.store.mapper.StoreReviewMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor

public class StoreReviewService {

    private final StoreReviewMapper storeReviewMapper;

    public List<Map<String, Object>> getReviewInfo(int store_seq) throws Exception {
        return storeReviewMapper.getReviewInfo(store_seq);
    }
}
