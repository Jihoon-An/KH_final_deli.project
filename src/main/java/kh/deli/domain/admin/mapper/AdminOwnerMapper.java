package kh.deli.domain.admin.mapper;


import kh.deli.domain.admin.dto.AdminAccountDTO;
import kh.deli.domain.admin.dto.AdminOwnerDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface AdminOwnerMapper {


    List<AdminOwnerDTO> selectOwnerList();


    @Delete("delete from owner where owner_seq = #{owner_seq}")
    int deleteOwner(@Param("owner_seq") int owner_seq);

    @Delete("delete from store where owner_seq = #{owner_seq}")
    int deleteStore(@Param("owner_seq")int owner_seq);


    List<Integer> selectStoreSeq(int owner_seq);

    List<Integer> selectMenuSeq(int store_seq);

    @Delete("delete from menu where store_seq = #{store_seq}")
    int deleteMenu(@Param("store_seq")int store_seq);


    @Delete("delete from menu_option where menu_seq =#{menu_seq}")
    int deleteMenuOption(@Param("menu_seq") int menu_seq);
}
