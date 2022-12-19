package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.OwnerDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OwnerStoreMapper {


    public void insertStore(StoreDTO dto);

    StoreDTO storeInfo(int store_seq);


    public List<StoreDTO> menuOrigin();



}
