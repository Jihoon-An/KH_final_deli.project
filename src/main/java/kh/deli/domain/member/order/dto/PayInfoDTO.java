package kh.deli.domain.member.order.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayInfoDTO {

    private int order_price;
    private int discountByCoupon;
    private int point;
    private int delivery_tip;
    private int pay_price;
    private String pay_method;


}
