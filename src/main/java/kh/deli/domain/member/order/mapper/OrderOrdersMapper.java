package kh.deli.domain.member.order.mapper;

import kh.deli.domain.member.order.dto.*;
import kh.deli.global.entity.OrdersDTO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface OrderOrdersMapper {
    public OrderOrdersDTO selectSessionInfo(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);
    public OrderOrdersDTO selectOrderMemberInfo(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);
    List<OrderOrdersDTO> selectCouponList(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);
    public void updateMemberAddr(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);

    public int updateMemberPhone(@Param("orderOrdersDTO")OrderOrdersDTO ordersDTO);
    public OrderOrdersDTO insertPayment(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);

    public OrderOrdersDTO insertOrders(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);

    
    StoreInfoDTO getStoreInfo(int order_seq);


    OrdererInfoDTO getOrdererInfo(int order_seq);

    PayInfoDTO getPayInfo(int order_seq);

    @Insert("insert into orders values(" +
            "order_seq.nextval, 31, 19, #{menu_list}, 19996216, sysdate, 777, 'tlqkf', " +
            "'01039300596', 'take', 'Y','씨발빨리와병신아', '카카오페이', 0, 0, '샘플바스켓 뻐큐', 5000, 20001216 )")
    void insertSampleBasket(@Param("menu_list") String menu_list);
    
    @Select("select * from orders where order_seq = #{order_seq}")
    OrdersDTO findOrdersBySeq(int order_seq);



}
