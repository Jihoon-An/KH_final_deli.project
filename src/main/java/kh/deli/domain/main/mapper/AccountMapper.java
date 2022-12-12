package kh.deli.domain.main.mapper;

import kh.deli.global.entity.AccountDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Mapper
public interface AccountMapper {

    void memberSignUp(AccountDTO accountDTO);

}
