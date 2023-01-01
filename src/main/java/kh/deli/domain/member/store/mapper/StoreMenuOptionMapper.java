package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.MenuOptionDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface StoreMenuOptionMapper {

    @Select("SELECT * FROM MENU_OPTION WHERE MENU_SEQ = #{menuSeq} order by 1")
    List<MenuOptionDTO> findByMenuSeq(@Param("menuSeq") int menuSeq);

    @Select("SELECT * FROM MENU_OPTION WHERE OPTION_SEQ IN ${optionSeqList} order by 1")
    List<MenuOptionDTO> getList(@Param("optionSeqList") String optionSeqList);
}
