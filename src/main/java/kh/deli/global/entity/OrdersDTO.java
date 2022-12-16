package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdersDTO {
    private int order_seq;
    private int acc_seq;
    private int store_seq;
    private String menu_list;
    private int order_price;
    Timestamp order_date;
    private int add_seq;
    private String add_detail2;
    private String order_phone;
    private String order_status;
    private String order_disposable;
    private int cp_seq;
    private int order_point;
    private String order_store_req;
    private String order_rider_req;
    private String pay_method;
    private int delivery_tip;
    private int pay_price;

    /* 결제 화면 조회 변수 */
    private int seq; //회원번호
    private String address1;    //주소 1
    private String address2;    //주소 2
    private String phoneNum;    //핸드폰 번호
    private String ownPoint;    //보유 포인트

}
