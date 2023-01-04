package kh.deli.domain.admin.mapper;

import kh.deli.global.entity.CouponDTO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface AdminCouponMapper {

    @Insert("INSERT INTO COUPON VALUES (" +
            "CP_SEQ.NEXTVAL, " +
            "#{cp.cp_code}, " +
            "#{cp.cp_name}, " +
            "#{cp.cp_content}, " +
            "#{cp.cp_discount}, " +
            "#{cp.cp_type}, " +
            "#{cp.cp_period})")
    void put(@Param("cp") CouponDTO coupon);

    @Select("SELECT COUNT(CP_CODE) FROM COUPON WHERE CP_CODE = #{code}")
    int getCpCodeByCpCode(@Param("code") String cpCode);

    @Select("SELECT * FROM COUPON")
    List<CouponDTO> getAll();

    @Delete("DELETE FROM COUPON WHERE CP_SEQ = #{seq}")
    void deleteBySeq(@Param("seq") int seq);

    @Select("SELECT ACCOUNT.ACC_SEQ FROM ACCOUNT JOIN MEMBER ON ACCOUNT.ACC_SEQ=MEMBER.ACC_SEQ WHERE ACCOUNT.ACC_EMAIL=#{email}")
    Integer selectByEmail(@Param("email") String user_email);

    @Insert("INSERT INTO MEMBER_COUPON VALUES(MC_SEQ.NEXTVAL,#{cp_seq},#{acc_seq},sysdate,sysdate+30)")
    void insertCoupon(@Param("cp_seq") Integer cp_seq,@Param("acc_seq") Integer acc_seq,@Param("cp_period") Integer cp_period);

    @Select("SELECT MEM_NICK FROM MEMBER WHERE ACC_SEQ=#{acc_seq}")
    String selectNickNameBySeq(@Param("acc_seq") Integer accSeq);
}
