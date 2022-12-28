package kh.deli.domain.member.order.mapper;

import kh.deli.global.entity.PaymentDTO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface OrderPaymentMapper {

    @Insert("INSERT INTO PAYMENT VALUES(" +
            "PAY_SEQ.NEXTVAL, " +
            "SYSDATE, " +
            "#{pay.order_seq}, " +
            "#{pay.pay_price}, " +
            "#{pay.pay_method}" +
            ")")
    void put(@Param("pay") PaymentDTO pay);
}
