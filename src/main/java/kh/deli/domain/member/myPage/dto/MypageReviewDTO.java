package kh.deli.domain.member.myPage.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.NClob;
import java.util.List;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MypageReviewDTO {
    private int acc_seq;    //회원번호
    private int rev_seq;    //리뷰번호
    private String mem_nick;    //닉네임
    private List<String> rev_sysname;  //리뷰사진
    private int rev_star;       //리뷰별점
    private String rev_content; //리뷰내용
    private List<String> menu_list;   //메뉴리스트
    private String order_seq;   //주문번호
    private String store_seq;   //식당번호
    private String store_name;  //식당이름
    private String rev_writetime;  //리뷰 작성 시간
    private String flag_udt;     //수정 여부 (Y, N)

}
