package kh.deli.domain.member.order.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdererInfoDTO {

    private String mem_phone;
    private String order_phone;
    private String order_store_req;
    private String order_rider_req;
    private String order_disposable;
    private String address_add_detail1;
    private String orders_add_detail2;

}
