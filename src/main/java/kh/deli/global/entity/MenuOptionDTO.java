package kh.deli.global.entity;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MenuOptionDTO {
    private int option_seq;
    private int menu_seq;
    private String option_group;
    private String option_name;
    private int option_price;
    private String option_required;
    private String option_multiple;
}
