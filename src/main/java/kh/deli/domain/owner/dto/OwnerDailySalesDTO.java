package kh.deli.domain.owner.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OwnerDailySalesDTO {

    private int daily_sales;
    private int store_seq;
    private String store_name;

}
