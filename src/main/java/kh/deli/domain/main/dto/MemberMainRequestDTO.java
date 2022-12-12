package kh.deli.domain.main.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberMainRequestDTO {
    private int store_seq;
    private String store_name;
    private String store_logo;
    private String store_min_price;
    private int store_deli_tip;
    private String store_deli_time;
    private Double avg_star;
}
