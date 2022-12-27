package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OwnerMemberMapper {

    @Select("SELECT * FROM MEMBER WHERE ACC_SEQ = #{accSeq}")
    MemberDTO getByAccSeq(@Param("accSeq") int accSeq);

    @Select("SELECT MEM_NAME, MEM_PHONE FROM " +
            "(SELECT ACC_SEQ, MEM_NAME, MEM_PHONE FROM MEMBER) M " +
            "LEFT JOIN (SELECT ACC_SEQ, ORDER_DATE, STORE_SEQ FROM ORDERS) O " +
            "ON M.ACC_SEQ = O.ACC_SEQ " +
            "WHERE STORE_SEQ = #{storeSeq} " +
            "ORDER BY ORDER_DATE DESC")
    List<MemberDTO> getListByStoreSeqWithOrder(@Param("storeSeq") int storeSeq);
}
