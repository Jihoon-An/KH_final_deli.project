package kh.deli.domain.owner.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OwnerDdSalesDTO {

    private int store_seq;
    private int owner_seq;
    private String daily_date;
    private int daily_sales;

}
