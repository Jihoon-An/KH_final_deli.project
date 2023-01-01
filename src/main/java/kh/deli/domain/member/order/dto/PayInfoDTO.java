package kh.deli.domain.member.order.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayInfoDTO {
    private String cp_type;

    private int order_price;
    private int discountByCoupon;
    private int discountByMoney;
    private int point;
    private int delivery_tip;
    private int pay_price1;
    private int pay_price2;
    private int pay_price3;
    private String pay_method;


}
