package kh.deli.domain.owner.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OwnerOrderCountDTO {

    private int daily_order_cnt;
    private int td_order_cnt;


}
