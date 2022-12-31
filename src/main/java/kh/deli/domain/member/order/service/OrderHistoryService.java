package kh.deli.domain.member.order.service;


import kh.deli.domain.member.order.dto.OrderHistoryDTO;
import kh.deli.domain.member.order.mapper.OrderHistoryMapper;
import kh.deli.global.entity.OrdersDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderHistoryService {


        @Autowired
        private OrderHistoryMapper orderHistoryMapper;

        public List<OrderHistoryDTO> selectOrderHistory(int acc_seq){
            return orderHistoryMapper.selectOrderHistory(acc_seq);
        }

        public List<OrdersDTO> findOrdersByAccSeq(int acc_Seq) throws  Exception{
            return orderHistoryMapper.findOrdersByAccSeq(acc_Seq);
        }


        public boolean isExistReivew(int order_seq){

            int result= orderHistoryMapper.isExistReivew(order_seq);

            if(result >0){ //
                return false; //작성불가능 1
            }

            return true; //작성가능 0
        }
}
