package kh.deli.domain.main.mapper;

import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.MemberDTO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MainAccountMapper {

    @Select("SELECT ACC_EMAIL FROM ACCOUNT WHERE ACC_EMAIL = #{email}")
    String findByEmail(@Param("email") String email);

    void insertOwner(@Param("acc") AccountDTO acc);

    @Delete("DELETE FROM OWNER WHERE ACC_SEQ = #{acc_seq}")
    void deleteOwner(@Param("acc_seq") Integer accSeq);

    @Select("SELECT ACC_SEQ.NEXTVAL FROM DUAL")
    int getNextAccSeq();

    int login(Map<String, String> param);


    void memberSignUp(AccountDTO accountDTO);
    void insertMember(MemberDTO memberDTO);
    void insertAddress(AddressDTO addressDTO);

    @Delete("DELETE FROM ACCOUNT WHERE ACC_SEQ = #{acc_seq}")
    void deleteAccount(int acc_seq);

    @Delete("DELETE FROM MEMBER WHERE ACC_SEQ = #{acc_seq}")
    void deleteMember(int acc_seq);

    @Delete("DELETE FROM ADDRESS WHERE ACC_SEQ = #{acc_seq}")
    void deleteAddress(int acc_seq);

    void kakaoSignUp(AccountDTO accountDTO);

    int findByAccToken(String acc_token);

    String getAccEmail(String acc_token);

    @Select("SELECT ACC_SEQ FROM ACCOUNT WHERE ACC_EMAIL = #{acc_email}")
    int getAccSeq(String acc_email);

    //MemberMainPage
    @Select("select acc_type from account where acc_seq=#{acc_seq}")
    String selectType (int acc_seq);

    @Select("SELECT ACC_EMAIL FROM MEMBER M JOIN ACCOUNT A ON M.ACC_SEQ = A.ACC_SEQ WHERE M.MEM_PHONE = #{mem_phone}")
    List<String> findEmailByPhoneNumber(@Param("mem_phone") String phoneNumber);

    @Select("SELECT A.ACC_SEQ " +
            "FROM MEMBER M JOIN ACCOUNT A ON M.ACC_SEQ = A.ACC_SEQ " +
            "WHERE A.ACC_EMAIL = #{acc_email} and M.MEM_PHONE = #{mem_phone}")
    Integer findSeqByEmailAndPhone(Map<String, String> param);

    @Update("UPDATE ACCOUNT SET ACC_PW = #{acc_pw} WHERE ACC_SEQ = #{acc_seq}")
    void modifyPassWordWithRandomCodeBySeq(Map<String, Object> param);

    @Select("SELECT OWNER_CARD_IMG FROM OWNER WHERE ACC_SEQ = #{acc_seq}")
    String findOwnerCardBySeq(@Param("acc_seq") int accSeq);
}
