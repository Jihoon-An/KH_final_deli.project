package kh.deli.domain.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminMainDTO {

    private String daily_date;
    private int daily_sales;
    private int sum_daily_sales;

}
