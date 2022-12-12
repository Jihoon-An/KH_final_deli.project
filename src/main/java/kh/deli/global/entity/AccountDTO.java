package kh.deli.global.entity;

import lombok.*;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountDTO {
    private int acc_seq;
    private String acc_email;
    private String acc_pw;
    private String acc_type;
    private String acc_sns;
    private String acc_token;
    private Timestamp acc_signupdate;
    private String acc_unregister;
}