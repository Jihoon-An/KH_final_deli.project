package kh.deli.domain.main.mapper;

import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.MemberDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface MainAccountMapper {

    @Select("SELECT ACC_EMAIL FROM ACCOUNT WHERE ACC_EMAIL = #{email}")
    String findByEmail(@Param("email") String email);

    void insertOwner(@Param("acc") AccountDTO acc);

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
}
