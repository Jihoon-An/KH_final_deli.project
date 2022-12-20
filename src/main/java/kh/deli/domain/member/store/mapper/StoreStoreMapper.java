package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StoreStoreMapper {


    public void insertStore(StoreDTO dto);

    //가게정보
    @Select("SELECT * FROM STORE WHERE STORE_SEQ =#{store_seq}")
    StoreDTO storeInfo(int store_seq);


    //식당 삭제
    @Delete("DELETE FROM STORE WHERE STORE_SEQ=#{store_seq}")
    int deleteStore(int store_seq);


    @Select("SELECT * FROM STORE WHERE STORE_SEQ = #{seq}")
    StoreDTO findBySeq(int seq);
}
