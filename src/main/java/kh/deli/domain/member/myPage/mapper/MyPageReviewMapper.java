package kh.deli.domain.member.myPage.mapper;

import kh.deli.domain.member.myPage.dto.MypageReviewDTO;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MyPageReviewMapper {

    public void reviewInsert(ReviewDTO dto);

    @Select("select * from orders where order_seq=#{order_seq}")
    public OrdersDTO selectByOrderSeq(int order_seq);

    @Select("SELECT * FROM REVIEW WHERE REV_SEQ=${rev_seq}")
    public ReviewDTO selectByReviewSeq(@Param("rev_seq") int rev_seq);

    @Select("SELECT * FROM STORE WHERE STORE_SEQ=${store_seq}")
    StoreDTO selectByStoreSeq(@Param("store_seq") int store_seq);

    public List<Map<String, Object>> getReviews(@Param("myReviewDTO") MypageReviewDTO param);

    @Select("SELECT COUNT(*) AS CNT FROM REVIEW WHERE ACC_SEQ = #{acc_seq};")
    static int getReviewCount(@Param("MypageReviewDTO") MypageReviewDTO reviewDTO) {
        return 0;
    }

//    static int getReviewCount(@Param("reviewCount") MypageReviewDTO param) {
//        return 0;
//    }

    @Update("update review set rev_star=#{rev_star},rev_content=#{rev_content},rev_modified_date=sysdate,rev_sysname=#{rev_sysname} where rev_seq=#{rev_seq}")
    public void modifyReview(Map<String,Object>param);

    @Select("select menu_name from menu where menu_seq=#{menu_seq} ")
    public String selectMenuName(String menuSeq);
}
