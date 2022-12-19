package kh.deli.domain.member.myPage.mapper;

import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MyPageMemberInfoMapper {

    @Select("SELECT * FROM ACCOUNT WHERE ACC_SEQ = ${acc_seq}")
    AccountDTO findAccountInfoBySeq(@Param("acc_seq") int accSeq);

    @Select("SELECT * FROM MEMBER WHERE ACC_SEQ = #{acc_seq}")
    MemberDTO findMemberInfoBySeq(@Param("acc_seq") int accSeq);


}
