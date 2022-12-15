package kh.deli.domain.member.order.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderHistoryDTO {
    private int store_seq;
    private String store_name;
    private String store_add_detail2;
    private String add_detail2;
    private String store_bsns_hours;
    private String store_logo;
    private String order_date;
    private int order_seq;
    private int acc_seq;
    private String menu_list;
    private int order_price;
    private int pay_price;
    private String order_status;
    private String order_rider_req;
    private String order_store_req;

}
