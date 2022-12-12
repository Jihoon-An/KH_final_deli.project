package kh.deli.domain.main.mapper;

import kh.deli.global.entity.AccountDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface AccountMapper {

    public int login(Map<String, String> param);
    public void insert(@Param("account") AccountDTO accountDTO);


}
