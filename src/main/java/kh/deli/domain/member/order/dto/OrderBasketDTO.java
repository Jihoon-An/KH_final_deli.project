package kh.deli.domain.member.order.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

/**
 * menu_list -> <menu, price>
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderBasketDTO {
    private int store_seq;
    private Map<String, Integer> menu_list;
    private int delivery_tip;
}
