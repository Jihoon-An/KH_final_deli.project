package kh.deli.domain.member.order.mapper;

import kh.deli.domain.member.order.dto.OrderOrdersDTO;
import kh.deli.domain.member.order.dto.OrdererInfoDTO;
import kh.deli.domain.member.order.dto.PayInfoDTO;
import kh.deli.domain.member.order.dto.StoreInfoDTO;
import kh.deli.global.entity.OrdersDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

                     
@Repository
@Mapper
public interface OrderOrdersMapper {

    public OrderOrdersDTO selectOrderMemberInfo(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);
    public void updateMemberAddr(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);
    
    StoreInfoDTO storeInfo(int order_seq);

    OrdererInfoDTO ordererInfo(int order_seq);

    PayInfoDTO payInfo(int order_seq);

    @Select("select * from orders where order_seq = #{order_seq}")
    OrdersDTO findOrdersBySeq(int order_seq);

}
