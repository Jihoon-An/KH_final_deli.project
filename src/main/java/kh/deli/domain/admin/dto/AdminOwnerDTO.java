package kh.deli.domain.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminOwnerDTO {

    private int owner_seq;
    private int acc_seq;
    private String owner_phone;
    private String owner_name;
    private String owner_num;
    private String acc_email;
    private Timestamp acc_signupdate;
    private int store_count; //보유식당 갯수
}
