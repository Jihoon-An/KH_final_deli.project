package kh.deli.domain.member.userMenu.service;

import kh.deli.domain.member.userMenu.mapper.MemberReviewFormMapper;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberReviewFormService {

    @Autowired
    private MemberReviewFormMapper memberReviewFormMapper;

    public void reviewInsert(ReviewDTO dto) throws Exception{
        memberReviewFormMapper.reviewInsert(dto);
    }

    public OrdersDTO selectByOrderSeq(int order_seq) throws Exception{
        memberReviewFormMapper.selectByOrderSeq(order_seq);
    }
}
