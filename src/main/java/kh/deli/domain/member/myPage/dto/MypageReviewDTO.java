package kh.deli.domain.member.myPage.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.NClob;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MypageReviewDTO {
    private int acc_seq;
    private String mem_nick;
    private NClob rev_sysname;
    private int rev_star;
    private String rev_content;
    private String menu_list;
}
