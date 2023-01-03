package kh.deli.domain.member.myPage.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MyPageCouponDTO {
    private Integer cp_seq;
    private String cp_code;
    private String cp_name;
    private String cp_content;
    private Integer cp_discount;
    private String cp_type;
    private Integer cp_period;
    private Timestamp mc_issue_date;
    private Timestamp mc_deadline;

}
