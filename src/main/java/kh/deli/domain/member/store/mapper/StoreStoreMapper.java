package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface StoreStoreMapper {


    public void insertStore(StoreDTO dto);
}
