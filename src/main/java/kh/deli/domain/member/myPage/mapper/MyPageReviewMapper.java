package kh.deli.domain.member.myPage.mapper;

import kh.deli.domain.member.store.dto.StoreReviewDTO;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MyPageReviewMapper {

    public void reviewInsert(ReviewDTO dto);

    public OrdersDTO selectByOrderSeq(int order_seq);

    @Select("SELECT * FROM REVIEW WHERE REV_SEQ=${rev_seq}")
    public ReviewDTO selectByReviewSeq(@Param("rev_seq") int rev_seq);

    @Select("SELECT * FROM STORE WHERE STORE_SEQ=${store_seq}")
    StoreDTO selectByStoreSeq(@Param("store_seq") int store_seq);

    //식당 리뷰 개수
    @Select("select count(*) from review where store_seq=#{store_seq}")
    int getReviewCount(int store_seq);

    //식당 별점 평균
    @Select("select round(avg(rev_star),1) from review where store_seq=${store_seq}")
    double getReviewAvg(int store_seq);

    List<StoreReviewDTO> getReviews(int store_seq);


}
