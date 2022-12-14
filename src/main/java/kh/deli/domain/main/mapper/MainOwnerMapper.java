package kh.deli.domain.main.mapper;

import kh.deli.global.entity.OwnerDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MainOwnerMapper {

    void put(@Param("owner") OwnerDTO owner);

}
