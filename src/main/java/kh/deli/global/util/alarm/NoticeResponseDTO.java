package kh.deli.global.util.alarm;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeResponseDTO {
    private Integer notice_seq;
    private String from_name;
    private String notice_title;
    private String notice_content;
    private Timestamp notice_time;
}
