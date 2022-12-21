package kh.deli.domain.member.order.dto;

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
    private String seq; //회원번호
    private String address1;    //주소 1
    private String address2;    //주소 2
    private String phoneNum;    //핸드폰 번호
    private String ownPoint;    //보유 포인트

    /* 쿠폰리스트 관련 변수 */
    private int mcSeq;
    private int cpSeq;
    private String cpName;
    private String cpContent;
    private String cpDiscount;
    private String cpPeriod;
    private String cpType;


    private List<OrderOrdersDTO> menuList;





}
