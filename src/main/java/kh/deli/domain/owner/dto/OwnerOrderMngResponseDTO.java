package kh.deli.domain.owner.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OwnerOrderMngResponseDTO {
    private Integer orderSeq;
    private String status;
    private String memberName;
    private List<String> menuStrList;
    private String address;
    private String phone;
    private String link;
}
