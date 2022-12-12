package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO {
    private int pay_seq;
    private Timestamp pay_date;
    private int order_seq;
    private int pay_price;
}
