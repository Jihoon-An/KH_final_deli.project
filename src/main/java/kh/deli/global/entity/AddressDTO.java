package kh.deli.global.entity;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddressDTO {
    private int add_seq;
    private int acc_seq;
    private String add_division;
    private String add_name;
    private String add_detail1;
    private String add_detail2;
    private String add_x;
    private String add_y;
    private String add_msg;
}