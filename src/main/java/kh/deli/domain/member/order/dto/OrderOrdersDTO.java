package kh.deli.domain.member.order.dto;

import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("OrderOrdersDTO")
public class OrderOrdersDTO {
    private int add_seq;
    private int store_seq;

    /* 회원정보 관련 변수 ( 세션없어서 임시로 만듬 ㅅㅂ) */
    private String accEmail;
    private String memName;

    /* 결제 화면 조회 변수 */
    private String acc_seq;     //회원번호
    private String address1;    //주소 1
    private String address2;    //주소 2
    private String phoneNum;    //핸드폰 번호
    private String ownPoint;    //보유 포인트
    private int usePoint;    // 사용 포인트
    private int order_price;    // 주문 금액
    private int delivery_tip;   // 배달팁
    private String order_disposable = "N"; //일회용품
    private String order_rider_req; // 라이더 요청사항
    private String order_store_req; // 가게 요청사항
    private String pay_method; // 결제 방법
    private int pay_price; // 총 결제 금액
    /* 쿠폰리스트 관련 변수 */
    private int cp_seq;
    private int mc_seq;
    private String cpName;
    private String cpContent;
    private int discount_coupon;
    private int order_point;
    private String cpPeriod;
    private String cpType;


    /* 쿠폰 관련 데이터 (DB랑 이름 맞춘거) */



    private String menuList;





}
