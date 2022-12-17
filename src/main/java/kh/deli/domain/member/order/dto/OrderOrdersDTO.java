package kh.deli.domain.member.order.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("OrderOrdersDTO")
public class OrderOrdersDTO {
    private int add_seq;
    private int store_seq;

    /* 결제 화면 조회 변수 */
    private int seq; //회원번호
    private String address1;    //주소 1
    private String address2;    //주소 2
    private String phoneNum;    //핸드폰 번호
    private String ownPoint;    //보유 포인트



}
