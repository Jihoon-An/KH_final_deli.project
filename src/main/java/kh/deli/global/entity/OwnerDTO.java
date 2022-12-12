package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OwnerDTO {
    private Integer owner_seq;
    private Integer acc_seq;
    private String owner_name;
    private String owner_phone;
    private String owner_num;
    private String owner_card_img;
}
