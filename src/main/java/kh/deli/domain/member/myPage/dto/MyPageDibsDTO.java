package kh.deli.domain.member.myPage.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPageDibsDTO {
    private Integer DIBS_SEQ;
    private Integer ACC_SEQ;
    private Integer STORE_SEQ;
    private String STORE_NAME;
    private String STORE_MIN_PRICE;
    private Integer STORE_DELI_TIP;
    private String STORE_DELI_TIME;
    private String STORE_LOGO;

}
