package kh.deli.domain.member.myPage.mapper;

import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface MyPageMemberInfoMapper {

    @Select("SELECT * FROM ACCOUNT WHERE ACC_SEQ = #{acc_seq}")
    AccountDTO findAccountInfoBySeq(@Param("acc_seq") int accSeq);

    @Select("SELECT * FROM MEMBER WHERE ACC_SEQ = #{acc_seq}")
    MemberDTO findMemberInfoBySeq(@Param("acc_seq") int accSeq);

    @Update("UPDATE MEMBER " +
            "SET " +
            "MEM_NICK = #{mem_nick}, " +
            "MEM_PHONE = #{mem_phone} " +
            "WHERE " +
            "ACC_SEQ = #{acc_seq}")
    void modifyMemberInfo(MemberDTO memberDTO);

    @Select("SELECT COUNT(*) FROM ACCOUNT WHERE ACC_SEQ = #{acc_seq} AND ACC_PW = #{acc_pw}")
    int checkOldPassWord(Map<String, Object>param);

    @Update("UPDATE ACCOUNT SET ACC_PW = #{acc_pw} WHERE ACC_SEQ = #{acc_seq}")
    void modifyAccountPW(Map<String, Object> param);

}
