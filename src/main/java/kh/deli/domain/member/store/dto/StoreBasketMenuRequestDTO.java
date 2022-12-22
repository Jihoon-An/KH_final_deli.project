package kh.deli.domain.member.store.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StoreBasketMenuRequestDTO {
    private Integer storeSeq;
    private Integer menuSeq;
    private List<Integer> optionSeqList;
    private Integer count;
    private Integer price;
}
