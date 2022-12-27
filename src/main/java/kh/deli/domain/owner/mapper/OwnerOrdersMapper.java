package kh.deli.domain.owner.mapper;

import kh.deli.domain.owner.dto.OwnerOrderMngRequestDTO;
import kh.deli.global.entity.OrdersDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OwnerOrdersMapper {

    @Select("SELECT * FROM ORDERS WHERE ORDER_SEQ = #{seq}")
    OrdersDTO findBySeq(@Param("seq") int seq);

    @Select("SELECT * FROM ORDERS WHERE STORE_SEQ = #{store_seq} ORDER BY ORDER_DATE DESC")
    List<OrdersDTO> getListByStoreSeq(@Param("store_seq") Integer storeSeq);

    @Select("SELECT ORDER_SEQ, ORDER_STATUS, MEM_NAME, MENU_LIST, ADD_DETAIL1, ADD_DETAIL2, MEM_PHONE, ORDER_DATE " +
            "FROM (SELECT ORDER_SEQ, ADD_DETAIL2, ORDER_DATE, MENU_LIST, ORDER_STATUS, ACC_SEQ, ADD_SEQ FROM ORDERS WHERE STORE_SEQ = #{storeSeq} ORDER BY ORDER_DATE DESC) O " +
            "LEFT JOIN (SELECT MEM_NAME, MEM_PHONE, ACC_SEQ FROM MEMBER) M ON M.ACC_SEQ = O.ACC_SEQ " +
            "LEFT JOIN (SELECT ADD_DETAIL1, ADD_SEQ FROM ADDRESS WHERE ADD_DIVISION = 'basics') A ON A.ADD_SEQ = O.ADD_SEQ")
    List<OwnerOrderMngRequestDTO> getOrderMngList(@Param("storeSeq") int storeSeq);

    @Update("UPDATE ORDERS SET ORDER_STATUS = #{newStatus} WHERE ORDER_SEQ IN ${seqList}")
    void updateStatus(
            @Param("seqList") String checkedSeqListJson
            ,@Param("newStatus") String newStatus
    );

}
