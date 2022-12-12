package kh.deli.domain.main.mapper;

import kh.deli.global.entity.AccountDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface AccountMapper {

    public void insert(@Param("account") AccountDTO accountDTO);

    public String findByEmail(@Param("email") String email);

    public void insertOwner(@Param("acc") AccountDTO acc);

    @Select("SELECT ACC_SEQ.NEXTVAL FROM DUAL")
    public int getAccSeq();

    public int login(Map<String, String> param);
    void memberSignUp(AccountDTO accountDTO);
}
