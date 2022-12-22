package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MenuOptionDTO {
    private int option_seq;
    private int menu_seq;
    private String option_group;
    private String option_name;
    private int option_price;
    private String option_required;
    private String option_duplichk;
}
