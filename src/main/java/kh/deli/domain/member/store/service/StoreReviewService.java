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

    //가게 리뷰 개수
    public int getReviewCount(int store_seq) throws Exception {
        return storeReviewMapper.getReviewCount(store_seq);
    }

    //가게 별점 평균
    public double getReviewAvg(int store_seq) throws Exception{
        return storeReviewMapper.getReviewAvg(store_seq);
    }

    //식당 상세 리뷰페이지 리뷰 가져오기
    public List<Map<String, Object>> getReviewInfo(int store_seq) throws Exception {
        return storeReviewMapper.getReviewInfo(store_seq);
    }
}
