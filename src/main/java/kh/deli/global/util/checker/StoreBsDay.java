package kh.deli.global.util.checker;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StoreBsDay {
    private String open;
    private Timestamp open_time;
    private Timestamp close_time;
}
