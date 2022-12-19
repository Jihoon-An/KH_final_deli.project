package kh.deli.domain.admin.mapper;


import kh.deli.domain.admin.dto.AdminAccountDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AdminAccountMapper {

    List<AdminAccountDTO> selectAccountList();
}
