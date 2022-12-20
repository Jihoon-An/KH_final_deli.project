package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.OwnerDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OwnerStoreMapper {

    public void insertStore(StoreDTO dto);

    @Select(" SELECT * FROM STORE WHERE STORE_SEQ=#{store_seq}")
    StoreDTO storeInfo(int store_seq);

    @Select(" SELECT STORE_ORIGIN FROM STORE,MENU WHERE MENU.STORE_SEQ=STORE.STORE_SEQ")
    public List<StoreDTO> menuOrigin();



}
