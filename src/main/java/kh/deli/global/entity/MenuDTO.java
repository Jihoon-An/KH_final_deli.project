package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuDTO {
    private int menu_seq;
    private int store_seq;
    private String menu_group;
    private String menu_name;
    private int menu_price;
    private String menu_intro;
    private String menu_img;
    private String menu_sold_out;
    private String menu_display;
    private int menu_num;
}
