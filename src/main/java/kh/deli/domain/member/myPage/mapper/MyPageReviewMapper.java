package kh.deli.domain.member.myPage.mapper;

import kh.deli.domain.member.myPage.dto.MypageReviewDTO;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MyPageReviewMapper {

    public void reviewInsert(ReviewDTO dto);

    @Select("select * from orders where order_seq=#{order_seq}")
    public OrdersDTO selectByOrderSeq(@Param("order_seq") int order_seq);

    @Select("SELECT * FROM REVIEW WHERE REV_SEQ=${rev_seq}")
    public ReviewDTO selectByReviewSeq(@Param("rev_seq") int rev_seq);

    @Select("SELECT * FROM STORE WHERE STORE_SEQ=${store_seq}")
    StoreDTO selectByStoreSeq(@Param("store_seq") int store_seq);

    public List<Map<String, Object>> getReviews(@Param("myReviewDTO") MypageReviewDTO param);


    public int getReviewCount(@Param("myReviewDTO") MypageReviewDTO reviewDTO);

//    static int getReviewCount(@Param("reviewCount") MypageReviewDTO param) {
//        return 0;
//    }

    @Update("update review set rev_star=#{rev_star},rev_content=#{rev_content},rev_modified_date=sysdate,rev_sysname=#{rev_sysname, jdbcType=VARCHAR} where rev_seq=#{rev_seq}")
    public void modifyReview(Map<String,Object>param);

    @Delete("delete from review where rev_seq = #{rev_seq}")
    int deleteReview(@Param("rev_seq") int rev_seq);
    @Select("select menu_name from menu where menu_seq=#{menuSeq} ")
    public String selectMenuName(@Param("menuSeq") String menuSeq);

}
