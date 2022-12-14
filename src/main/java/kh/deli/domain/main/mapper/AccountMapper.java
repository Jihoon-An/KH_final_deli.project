package kh.deli.domain.main.mapper;

import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface AccountMapper {

    @Select("SELECT ACC_EMAIL FROM ACCOUNT WHERE ACC_EMAIL = #{email}")
    String findByEmail(@Param("email") String email);

    void insertOwner(@Param("acc") AccountDTO acc);

    @Select("SELECT ACC_SEQ.NEXTVAL FROM DUAL")
    int getAccSeq();

    int login(Map<String, String> param);

    void memberSignUp(AccountDTO accountDTO);
    void insertMember(MemberDTO memberDTO);
    void insertAddress(AddressDTO addressDTO);

    void kakaoSignUp(AccountDTO accountDTO);

    int findByAccToken(String acc_token);

    String getAccEmail(String acc_token);
}
