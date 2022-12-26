package kh.deli.domain.member.store.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StoreReviewMapper {

    //가게 리뷰 개수
    @Select("SELECT COUNT(*) FROM REVIEW WHERE STORE_SEQ=#{store_seq}")
    int getReviewCount(int store_seq);

    //가게 별점 평균
    @Select("SELECT nvl(ROUND(avg(rev_star),1),0) FROM REVIEW WHERE STORE_SEQ=#{store_seq}")
    double getReviewAvg(int store_seq);
    
    //식당 상세 리뷰페이지 리뷰 가져오기
    List<Map<String,Object>> getReviewInfo(int store_seq);

}
