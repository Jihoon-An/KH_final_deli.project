package kh.deli.domain.member.order.mapper;

import kh.deli.domain.member.order.dto.OrdererInfoDTO;
import kh.deli.domain.member.order.dto.PayInfoDTO;
import kh.deli.domain.member.order.dto.StoreInfoDTO;
import kh.deli.global.entity.OrdersDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface OrderOrdersMapper {

    public void insert(@Param("orders")OrdersDTO orders);
    
    StoreInfoDTO storeInfo(int order_seq);

    OrdererInfoDTO ordererInfo(int order_seq);

    PayInfoDTO payInfo(int order_seq);

}
