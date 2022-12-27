package kh.deli.domain.owner.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StoreNameAndSeqRequestDTO {
    private String store_name;
    private Integer store_seq;
}
