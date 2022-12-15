package kh.deli.domain.member.order.mapper;

import kh.deli.domain.member.order.dto.OrderHistoryDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OrderHistoryMapper {

    public List<OrderHistoryDTO> selectOrderHistory(int acc_seq);
    //매개변수 session으로 매개변수 받게 될 예정

}
