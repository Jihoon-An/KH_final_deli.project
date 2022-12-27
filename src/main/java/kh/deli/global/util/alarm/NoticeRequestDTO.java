package kh.deli.global.util.alarm;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeRequestDTO {
    private Integer to_acc_seq;
    private String user_type;
    private String title;
    private String content;
}
