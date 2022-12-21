package kh.deli.domain.admin.mapper;


import kh.deli.domain.admin.dto.AdminAccountDTO;
import kh.deli.domain.admin.dto.AdminOwnerDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface AdminOwnerMapper {


    List<AdminOwnerDTO> selectOwnerList();


    @Delete("delete from owner where owner_seq = #{owner_seq}")
    int deleteOwner(@Param("owner_seq") int owner_seq);
}
