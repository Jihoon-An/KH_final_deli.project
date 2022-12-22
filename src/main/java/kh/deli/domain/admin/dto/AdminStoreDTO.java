package kh.deli.domain.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminStoreDTO {

    private int store_seq;
    private String store_name;
    private String store_phone;
    private String store_category;
    private String store_add_detail1;
    private String store_add_detail2;
    private String store_display;
    private String owner_num;
    private String owner_name;

}
