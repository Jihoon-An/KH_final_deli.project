package kh.deli.global.util.checker;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StoreBsTimeInfo {
    private StoreBsDay mon;
    private StoreBsDay tue;
    private StoreBsDay wed;
    private StoreBsDay thu;
    private StoreBsDay fri;
    private StoreBsDay sat;
    private StoreBsDay sun;
}
