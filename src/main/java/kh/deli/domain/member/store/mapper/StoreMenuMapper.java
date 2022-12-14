package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.MenuDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface StoreMenuMapper {

    public void insertMenu(MenuDTO dto);
}
