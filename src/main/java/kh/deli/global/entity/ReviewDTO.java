package kh.deli.global.entity;

import lombok.*;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
    private int rev_seq;
    private int acc_seq;
    private String rev_sysname;
    private int rev_star;
    private String rev_content;
    private int store_seq;
    private int order_seq;
    private Timestamp rev_writedate;
    private Timestamp rev_modified_date;
    private String review_display;
}
