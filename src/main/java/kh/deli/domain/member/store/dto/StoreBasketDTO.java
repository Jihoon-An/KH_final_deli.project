package kh.deli.domain.member.store.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * menu_list -> < menu, price >
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StoreBasketDTO {
    private Integer storeSeq;
    private List<StoreBasketMenuRequestDTO> menuList;
    private Integer totalPrice;

}












