package kh.deli.domain.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminMainDTO {

    private String daily_date;
    private int daily_sales;
    private int sum_daily_sales;
    private Timestamp pay_date;
    private int pay_price;

}
