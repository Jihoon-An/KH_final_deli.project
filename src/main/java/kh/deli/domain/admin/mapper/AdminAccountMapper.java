package kh.deli.domain.admin.mapper;


import kh.deli.domain.admin.dto.AdminAccountDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AdminAccountMapper {

    List<AdminAccountDTO> selectAccountList();


    @Delete("delete from account where acc_seq = #{acc_seq}")
    int deleteAccount(@Param("acc_seq") int acc_seq);
}
