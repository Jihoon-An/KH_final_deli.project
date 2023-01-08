package kh.deli.global.util.alarm;

import kh.deli.global.entity.UserType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeRequestDTO {
    private Integer toAccSeq;
    private String userType;
    private String title;
    private String content;
    private UserType fromUserType;
}
