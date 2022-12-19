package kh.deli.domain.member.store.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface StoreReviewMapper {

    //가게 리뷰 개수
    @Select("select count(*) from store where store_seq=#{store_seq}")
    int getReviewCount(int store_seq);

    //가게 별점 평균
    @Select("select round(avg(rev_star),1) from review where store_seq=#{store_seq}")
    double getReviewAvg(int store_seq);
    
    //식당 상세 리뷰페이지 리뷰 가져오기
    List<Map<String,Object>> getReviewInfo(int store_seq);

}
