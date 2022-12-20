package kh.deli.domain.member.store.service;

import com.google.gson.Gson;
import kh.deli.domain.member.order.dto.OrderBasketDTO;
import kh.deli.domain.member.order.dto.OrderBasketMenuDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class StoreBasketService {

    private final StoreStoreService storeService;
    private final OrderBasketService basketService;
    private final Gson gson;

    public String getNewBasket(String json) {

        OrderBasketMenuDTO basketMenu = gson.fromJson(json, OrderBasketMenuDTO.class);

        OrderBasketDTO newBasket = new OrderBasketDTO();

        StoreDTO store = storeService.findBySeq(basketMenu.getMenu().getStore_seq());

        List<OrderBasketMenuDTO> menuDTOList = new ArrayList<>();
        menuDTOList.add(basketMenu);

        newBasket.setMenuList(menuDTOList);
        newBasket.setStore(store);
        newBasket.setTotalPrice(basketService.getTotalPrice(newBasket.getMenuList()));

        return gson.toJson(newBasket);
    }

    public String addBasketMenuList(String basketJson, String newMenuJson) {
        OrderBasketDTO basket = gson.fromJson(basketJson, OrderBasketDTO.class);
        OrderBasketMenuDTO newMenu = gson.fromJson(newMenuJson, OrderBasketMenuDTO.class);

        basket.getMenuList().add(newMenu);
        basket.setTotalPrice(basketService.getTotalPrice(basket.getMenuList()));

        return gson.toJson(basket);
    }

}
