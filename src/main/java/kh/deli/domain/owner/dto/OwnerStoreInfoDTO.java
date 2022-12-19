package kh.deli.domain.owner.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OwnerStoreInfoDTO {

    private int owner_seq;
    private int store_seq;
    private String store_name;
}
