package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
    private Integer notice_seq;
    private Integer from_acc_seq;
    private Integer to_acc_seq;
    private String notice_title;
    private String notice_content;
    Timestamp notice_time;
}
