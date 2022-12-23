package kh.deli.domain.owner.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OwnerOrderMngRequestDTO {
    private Integer order_seq;
    private String order_status;
    private String mem_name;
    private String menu_list; //json
    private String add_detail1;
    private String add_detail2;
    private String mem_phone;
    private Timestamp order_date;
}
