package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuOptionDTO {
    private int menu_option_seq;
    private int menu_seq;
    private String menu_option;
    private String option_name;
    private int option_price;
    private String option_required;
}
