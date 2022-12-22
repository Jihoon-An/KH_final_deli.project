package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.OrdersDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface OwnerOrdersMapper {

    @Select("SELECT * FROM ORDERS WHERE ORDER_SEQ = #{seq}")
    OrdersDTO findBySeq(@Param("seq") int seq);
}
