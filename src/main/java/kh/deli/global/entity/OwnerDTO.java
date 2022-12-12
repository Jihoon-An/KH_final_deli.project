package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OwnerDTO {
    private int owner_seq;
    private int acc_seq;
    private String owner_name;
    private String owner_phone;
    private String owner_num;
    private String owner_card_img;
}
