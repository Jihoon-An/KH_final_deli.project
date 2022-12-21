package kh.deli.domain.member.myPage.mapper;

import kh.deli.domain.member.myPage.dto.MypageReviewListDTO;
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

    public List<MypageReviewListDTO> getReviews();
}
