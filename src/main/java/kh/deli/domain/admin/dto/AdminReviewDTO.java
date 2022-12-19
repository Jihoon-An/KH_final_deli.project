package kh.deli.domain.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminReviewDTO {
    private String mem_name;
    private String rev_content;
    private String store_name;
    private String rev_writedate;
    private String rev_modifieddate;
    private int rev_seq;
    private int rev_star;
    private String review_display;
}


