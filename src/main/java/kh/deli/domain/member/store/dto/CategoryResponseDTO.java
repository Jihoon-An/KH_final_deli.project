package kh.deli.domain.member.store.dto;

import kh.deli.global.entity.MenuDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryResponseDTO {

private String menu_group;

private List<MenuDTO> menuList;

}
