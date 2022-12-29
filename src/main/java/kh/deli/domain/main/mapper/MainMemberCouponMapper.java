package kh.deli.domain.main.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MainMemberCouponMapper {
    // 회원가입 쿠폰 발행
    @Select("INSERT INTO MEMBER_COUPON VALUES(MC_SEQ.NEXTVAL, 4, #{accSeq}, SYSDATE, (SYSDATE + 30))")
    void giveSignUpCp(@Param("accSeq") int accSeq);
}
