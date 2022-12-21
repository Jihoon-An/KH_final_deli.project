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
    private String mem_nick;
    private String mem_phone;
    private String add_detail1;
    private Timestamp acc_signupdate;
    private String mem_grade;

}

/*
@AllArgsConstructor //여기에 필드에 쓴 모든생성자만 만들어줌
@NoArgsConstructor //기본 생성자를 만들어줌
@Data // getter, setter 만들어줌
 */