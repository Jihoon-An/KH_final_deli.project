package kh.deli.domain.member.order.mapper;

import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface OrderBasketMapper {

    @Select("SELECT * FROM STORE WHERE STORE_SEQ = #{store_seq}")
    StoreDTO findStoreBySeq(@Param("store_seq") int storeSeq);

    @Select("SELECT * FROM MENU WHERE MENU_SEQ = #{menu_seq}")
    MenuDTO findMenuBySeq(@Param("menu_seq") int menuSeq);

    @Select("SELECT * FROM MENU_OPTION WHERE OPTION_SEQ = #{option_seq}")
    MenuOptionDTO findMenuOptionBySeq(@Param("option_seq") int optionSeq);

}
