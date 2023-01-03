package kh.deli.domain.member.myPage.service;

import kh.deli.domain.member.myPage.dto.MyPageCouponDTO;
import kh.deli.domain.member.myPage.mapper.MyPageCouponPointMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class MyPageCouponPointService {

    private final MyPageCouponPointMapper myPageCouponPointMapper;

    public int findMemberPointBySeq(int accSeq) throws Exception {
        return myPageCouponPointMapper.findMemberPointBySeq(accSeq);
    }

    public List<MyPageCouponDTO> findMemberCouponBySeq(int accSeq) throws Exception {
        return myPageCouponPointMapper.findMemberCouponBySeq(accSeq);
    }



}
