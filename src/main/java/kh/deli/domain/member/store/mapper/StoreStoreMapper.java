package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StoreStoreMapper {


    public void insertStore(StoreDTO dto);

    //가게정보
    StoreDTO storeInfo(int store_seq);

    int getReviewCount(int store_seq);

    public List<StoreDTO> menuOrigin();

    //식당 삭제
    int deleteStore(int store_seq);

    //식당 수정
    int modifyStore(Map<String,Object> param);


}
