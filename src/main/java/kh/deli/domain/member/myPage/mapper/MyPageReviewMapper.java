package kh.deli.domain.member.myPage.mapper;

import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MyPageReviewMapper {

    public void reviewInsert(ReviewDTO dto);

    public OrdersDTO selectByOrderSeq(int order_seq);
}
