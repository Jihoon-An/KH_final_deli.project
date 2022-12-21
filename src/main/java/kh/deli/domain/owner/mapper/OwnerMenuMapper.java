package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OwnerMenuMapper {

    public void insertMenu(MenuDTO menuDTO);
    public void insertMenuOption(MenuOptionDTO menuOptionDTO);

    // 메뉴 수정 진행중
    public void modifyMenu(MenuDTO menuDTO);

    @Select("SELECT Menu_seq.NEXTVAL FROM DUAL")
    int getNextMenuSeq();


    List<String> menuInfo(int store_seq);

    List<MenuDTO> menuList(String menu_group,int store_seq);

}
