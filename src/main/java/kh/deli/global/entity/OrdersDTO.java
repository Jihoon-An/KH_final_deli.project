package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrdersDTO {
    private Integer order_seq;
    private Integer acc_seq;
    private Integer store_seq;
    private String menu_list;
    private Integer order_price;
    Timestamp order_date;
    private Integer add_seq;
    private String add_detail2;
    private String order_phone;
    private String order_status;
    private String order_disposable;
    private String order_rider_req;
    private String pay_method;
    private Integer cp_seq;
    private Integer order_point;
    private String order_store_req;
    private Integer delivery_tip;
    private Integer pay_price;
}
