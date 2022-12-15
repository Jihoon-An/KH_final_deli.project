package kh.deli.domain.member.order.mapper;

import kh.deli.global.entity.MenuDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OrderMenuMapper {

    @Select("SELECT * FROM MENU WHERE MENU_SEQ = ${menu_seq}")
    MenuDTO findBySeq(@Param("menu_seq") int menuSeq);
}
