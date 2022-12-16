package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface OwnerStoreMapper {


    public void insertStore(StoreDTO dto);

    StoreDTO storeInfo(int store_seq);

    MenuDTO menuInfo(int store_seq);


}
