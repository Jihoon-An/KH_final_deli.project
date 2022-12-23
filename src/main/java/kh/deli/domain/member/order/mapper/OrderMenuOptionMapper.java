package kh.deli.domain.member.order.mapper;

import kh.deli.global.entity.MenuOptionDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrderMenuOptionMapper {
    @Select("SELECT * FROM MENU_OPTION WHERE OPTION_SEQ = ${option_seq}")
    MenuOptionDTO findBySeq(@Param("option_seq") int optionSeq);

    @Select("SELECT * FROM MENU_OPTION WHERE MENU_SEQ = ${menu_seq}")
    List<MenuOptionDTO> findByMenuSeq(@Param("menu_seq") int menuSeq);

    @Select("SELECT * FROM MENU_OPTION WHERE OPTION_SEQ IN ${seqListStr}")
    List<MenuOptionDTO> getListBySeq(@Param("seqListStr") String seqListStr);
}
