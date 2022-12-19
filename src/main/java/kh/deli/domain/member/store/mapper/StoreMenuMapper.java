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

    @Select("select distinct menu_group from menu where store_seq=#{store_seq}")
    List<String> menuInfo(@Param("store_seq") int store_seq);

    @Select("select * from menu where menu_group=#{menu_group} and store_seq=#{store_seq}")
    List<MenuDTO> menuList(Map<String, Object> param);


}
