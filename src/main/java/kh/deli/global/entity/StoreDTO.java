package kh.deli.global.entity;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreDTO {
    private int store_seq;
    private String store_name;
    private String store_category;
    private String store_phone;
    private String store_intro;
    private String store_min_price;
    private int store_deli_tip;
    private String store_deli_time;
    private String store_bsns_hours;
    private String store_close_day;
    private String store_add_detail1;
    private String store_add_detail2;
    private String store_add_x;
    private String store_add_y;
    private String store_logo;
    private String store_origin;
    private String store_open;
    private String store_display;
    private String store_destination;
}
