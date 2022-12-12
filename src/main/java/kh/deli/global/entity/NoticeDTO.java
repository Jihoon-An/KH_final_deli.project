package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
    private int notice_seq;
    private int from_acc_seq;
    private int to_acc_seq;
    private String notice_title;
    private String notice_content;
    Timestamp notice_time;
}
