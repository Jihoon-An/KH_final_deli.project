package kh.deli.domain.member.order.dto;

import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.*;

/**
 * menu_list -> < menu, price >
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderBasketDTO {
    private StoreDTO store;
    private List<OrderBasketMenuDTO> menuList;
    private int totalPrice;

}












