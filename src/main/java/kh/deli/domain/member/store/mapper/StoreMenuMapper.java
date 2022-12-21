package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.CouponDTO;
import kh.deli.global.entity.MenuDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StoreMenuMapper {

    public void insertMenu(MenuDTO dto);

    @Select("SELECT DISTINCT MENU_GROUP FROM MENU WHERE STORE_SEQ=#{store_seq}")
    List<String> menuInfo(@Param("store_seq") int store_seq);

    @Select("SELECT * FROM MENU WHERE MENU_GROUP=#{menu_group} AND STORE_SEQ=#{store_seq}")
    List<MenuDTO> menuList(Map<String, Object> param);

    @Select("SELECT * FROM MENU WHERE MENU_SEQ = #{seq}")
    public MenuDTO findBySeq(int seq);
}
