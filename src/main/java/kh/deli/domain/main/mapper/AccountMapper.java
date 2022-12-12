package kh.deli.domain.main.mapper;

import kh.deli.global.entity.AccountDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
@Mapper
public interface AccountMapper {
    public void insert(@Param("account") AccountDTO accountDTO);

}
