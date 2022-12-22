package kh.deli.domain.member.myPage.mapper;

import kh.deli.domain.member.myPage.dto.MypageReviewDTO;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MyPageReviewMapper {

    public void reviewInsert(ReviewDTO dto);

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
    }

