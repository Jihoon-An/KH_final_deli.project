package kh.deli.domain.main.mapper;

import kh.deli.global.entity.AccountDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface MainAccountMapper {

    void insert(@Param("account") AccountDTO accountDTO);

    @Select("SELECT ACC_EMAIL FROM ACCOUNT WHERE ACC_EMAIL = #{email}")
    String findByEmail(@Param("email") String email);

    void insertOwner(@Param("acc") AccountDTO acc);

    @Select("SELECT ACC_SEQ.NEXTVAL FROM DUAL")
    int getAccSeq();

    int login(Map<String, String> param);

    void memberSignUp(AccountDTO accountDTO);

    void kakaoSignUp(AccountDTO accountDTO);

    int findByAccToken(String acc_token);

    String getAccEmail(String acc_token);

    int getAccSeq(String acc_email);
}
