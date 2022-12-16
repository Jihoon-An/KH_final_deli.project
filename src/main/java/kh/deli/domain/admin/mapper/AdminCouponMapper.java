package kh.deli.domain.admin.mapper;

import kh.deli.global.entity.CouponDTO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    @Delete("DELETE FROM COUPON WHERE CP_SEQ = #{seq")
    void deleteBySeq(@Param("seq") int seq);
}
