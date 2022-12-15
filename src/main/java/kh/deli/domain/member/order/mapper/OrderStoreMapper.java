package kh.deli.domain.member.order.mapper;

import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OrderStoreMapper {
    @Select("SELECT * FROM STORE WHERE STORE_SEQ = ${store_seq}")
    StoreDTO findBySeq(@Param("store_seq") int storeSeq);
}
