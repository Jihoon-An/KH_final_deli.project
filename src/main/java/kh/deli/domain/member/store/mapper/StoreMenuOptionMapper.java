package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.MenuOptionDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface StoreMenuOptionMapper {

    @Select("SELECT * FROM MENU_OPTION WHERE MENU_SEQ = #{menuSeq}")
    List<MenuOptionDTO> findByMenuSeq(int menuSeq);

}
