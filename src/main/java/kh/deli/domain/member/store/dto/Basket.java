package kh.deli.domain.member.store.dto;

import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Basket {
    private StoreDTO store;
    private List<BasketMenu> menuList;
    private Integer totalPrice;
}
