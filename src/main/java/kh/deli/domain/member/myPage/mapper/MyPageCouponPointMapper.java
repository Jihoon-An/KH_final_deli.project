package kh.deli.domain.member.myPage.mapper;

import kh.deli.domain.member.myPage.dto.MyPageCouponDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MyPageCouponPointMapper {



    @Select("SELECT MEM_POINT FROM MEMBER WHERE ACC_SEQ = #{acc_seq}")
    int findMemberPointBySeq(@Param("acc_seq") int accSeq);

    @Select("SELECT " +
            "C.CP_SEQ, C.CP_CODE, C.CP_NAME, C.CP_CONTENT, C.CP_DISCOUNT, C.CP_TYPE, C.CP_PERIOD, " +
            "M.MC_ISSUE_DATE, M.MC_DEADLINE " +
            "FROM MEMBER_COUPON M " +
            "JOIN COUPON C ON M.CP_SEQ = C.CP_SEQ " +
            "WHERE ACC_SEQ = #{acc_seq}")
    List<MyPageCouponDTO> findMemberCouponBySeq(@Param("acc_seq") int accSeq);



}
