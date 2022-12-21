package kh.deli.domain.member.store.service;

import com.google.gson.Gson;
import kh.deli.domain.member.order.dto.OrderBasketDTO;
import kh.deli.domain.member.order.dto.OrderBasketMenuDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class StoreBasketService {

    private final StoreStoreService storeService;
    private final OrderBasketService basketService;
    private final Gson gson;

    public void setBasketInSession(HttpSession session, String newMenuJson) {
        OrderBasketDTO basket = (OrderBasketDTO) session.getAttribute("basket");
        if (basket == null) {
            OrderBasketMenuDTO basketMenu = gson.fromJson(newMenuJson, OrderBasketMenuDTO.class);
            StoreDTO store = storeService.findBySeq(basketMenu.getMenu().getStore_seq());

            List<OrderBasketMenuDTO> menuDTOList = new ArrayList<>();
            menuDTOList.add(basketMenu);

            OrderBasketDTO newBasket = OrderBasketDTO.builder()
                    .store(store)
                    .menuList(menuDTOList)
                    .totalPrice(basketService.getTotalPrice(menuDTOList))
                    .build();

            session.setAttribute("basket", newBasket);
        } else {
            basket.getMenuList()
                    .add(gson.fromJson(newMenuJson, OrderBasketMenuDTO.class));
            session.setAttribute("basket", basket);
        }
    }


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
}
