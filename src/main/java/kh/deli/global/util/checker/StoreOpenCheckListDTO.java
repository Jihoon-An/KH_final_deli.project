package kh.deli.global.util.checker;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StoreOpenCheckListDTO {
    private String bs_time_json;
    private String open;
    private String display;
}
