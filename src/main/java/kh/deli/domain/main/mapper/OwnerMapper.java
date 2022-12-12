package kh.deli.domain.main.mapper;

import kh.deli.global.entity.OwnerDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface OwnerMapper {

    public void insert(@Param("owner") OwnerDTO owner);
}
