package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.mapper.OrderPaymentMapper;
import kh.deli.global.entity.PaymentDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class OrderPaymentService {
    private final OrderPaymentMapper payMapper;

    public void put(PaymentDTO paymentDto){
        payMapper.put(paymentDto);
    }
}
