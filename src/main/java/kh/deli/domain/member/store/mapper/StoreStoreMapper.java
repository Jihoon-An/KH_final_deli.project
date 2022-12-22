package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.StoreDTO;
import kh.deli.global.util.checker.StoreOpenCheckListDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

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

    /**
     * @param seq - storeSeq
     */
    @Select("SELECT STORE_BSNS_HOURS AS BS_TIME_JSON, STORE_OPEN AS OPEN, STORE_DISPLAY  AS DISPLAY FROM STORE WHERE STORE_SEQ = #{seq}")
    StoreOpenCheckListDTO getOpenCheckListBySeq(@Param("seq") int seq);
}
