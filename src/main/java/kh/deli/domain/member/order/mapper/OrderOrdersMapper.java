package kh.deli.domain.member.order.mapper;

import kh.deli.domain.member.order.dto.OrderOrdersDTO;
import kh.deli.global.entity.OrdersDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface OrderOrdersMapper {

    public OrderOrdersDTO selectOrderMemberInfo(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);
    public void updateMemberAddr(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);

}
