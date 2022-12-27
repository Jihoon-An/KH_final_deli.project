package kh.deli.global.entity;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private int  acc_seq;
    private String mem_seq;
    private String mem_name;
    private String mem_phone;
    private String mem_nick;
    private String mem_birthday;
    private String mem_sex;
    private String mem_grade;
    private int   mem_point;
}
