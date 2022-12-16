package kh.deli.domain.member.order.dto;

import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderBasketMenuDTO {
    private MenuDTO menu;
    private List<MenuOptionDTO> options;
    private Integer count;
}
