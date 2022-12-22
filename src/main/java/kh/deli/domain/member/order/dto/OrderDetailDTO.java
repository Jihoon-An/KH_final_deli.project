package kh.deli.domain.member.order.dto;

import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailDTO {

    private MenuDTO menuDTO;
    private List<MenuOptionDTO> menuOptionDTO;
    private int count;
    private int price;

}







