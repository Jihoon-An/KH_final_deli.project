package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CouponDTO {
    private int cp_seq;
    private String cp_code;
    private String cp_name;
    private String cp_content;
    private int cp_discount;
    private String cp_type;
    private int cp_period;
}
