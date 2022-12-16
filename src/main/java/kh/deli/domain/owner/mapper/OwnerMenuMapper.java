package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.MenuDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface OwnerMenuMapper {

    public void insertMenu(MenuDTO dto);
}
