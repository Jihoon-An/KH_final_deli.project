package kh.deli.domain.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminAccountDTO {

    private int acc_seq;
    private String acc_email;
    private String mem_name;
    private String mem_phone;
    private String add_detail1;
    private Timestamp acc_signupdate;
    private String mem_grade;

}
