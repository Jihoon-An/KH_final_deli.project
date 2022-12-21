package kh.deli.domain.member.store.service;

import com.google.gson.Gson;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.store.dto.StoreBasketDTO;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class StoreBasketService {

    private final OrderBasketService basketService;
    private final Gson gson;

    public void setBasketInSession(HttpSession session, String newMenuJson) {
        StoreBasketDTO basket = (StoreBasketDTO) session.getAttribute("basket");
        if (basket == null) {
            StoreBasketMenuRequestDTO basketMenu = gson.fromJson(newMenuJson, StoreBasketMenuRequestDTO.class);

            List<StoreBasketMenuRequestDTO> menuList = new ArrayList<>();
            menuList.add(basketMenu);

            StoreBasketDTO newBasket = StoreBasketDTO.builder()
                    .storeSeq(basketMenu.getStoreSeq())
                    .menuList(menuList)
                    .totalPrice(basketService.getTotalPriceByMenuList(menuList))
                    .build();

            session.setAttribute("basket", newBasket);
        } else {
            basket.getMenuList()
                    .add(gson.fromJson(newMenuJson, StoreBasketMenuRequestDTO.class));
            session.setAttribute("basket", basket);
        }
    }
}
