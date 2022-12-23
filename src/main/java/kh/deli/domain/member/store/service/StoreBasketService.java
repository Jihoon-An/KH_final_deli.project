package kh.deli.domain.member.store.service;

import com.google.gson.Gson;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.store.dto.Basket;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.domain.member.store.dto.BasketMenu;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.util.checker.Checker;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class StoreBasketService {

    private final OrderBasketService basketService;
    private final StoreStoreService storeService;
    private final StoreMenuService menuService;
    private final StoreMenuOptionService optionService;
    private final Gson gson;
    private final Checker checker;

    public void setBasketInSession(HttpSession session, String newMenuJson) throws ParseException {
        BasketDTO basket = (BasketDTO) session.getAttribute("basket");
        StoreBasketMenuRequestDTO basketMenu = gson.fromJson(newMenuJson, StoreBasketMenuRequestDTO.class);
//        checker.storeBsTimeCheckToError(basketMenu.getStoreSeq());

        if (basket == null) {

            List<StoreBasketMenuRequestDTO> menuList = new ArrayList<>();
            menuList.add(basketMenu);

            BasketDTO newBasket = BasketDTO.builder()
                    .storeSeq(basketMenu.getStoreSeq())
                    .menuList(menuList)
                    .totalPrice(basketService.getTotalPriceByMenuList(menuList))
                    .build();

            session.setAttribute("basket", newBasket);
        } else {
            basket.getMenuList()
                    .add(gson.fromJson(newMenuJson, StoreBasketMenuRequestDTO.class));
            basket.setTotalPrice(basketService.getTotalPriceByMenuList(basket.getMenuList()));
            session.setAttribute("basket", basket);
        }
    }

    public Basket basketDtoToObject(BasketDTO dto) {

        List<BasketMenu> basketMenus = new ArrayList<>();

        for (StoreBasketMenuRequestDTO basketMenuSeq : dto.getMenuList()) {
            MenuDTO menu = menuService.findBySeq(basketMenuSeq.getMenuSeq());
            List<MenuOptionDTO> options = optionService.parseSeqToObjectList(basketMenuSeq.getOptionSeqList());

            basketMenus.add(BasketMenu.builder()
                    .menu(menu)
                    .optionList(options)
                    .count(basketMenuSeq.getCount())
                    .price(basketMenuSeq.getPrice())
                    .build()
            );
        }

        return Basket.builder()
                .store(storeService.findBySeq(dto.getStoreSeq()))
                .menuList(basketMenus)
                .totalPrice(dto.getTotalPrice())
                .build();
    }

    public List<BasketMenu> basketMenuListDtoToObject(List<StoreBasketMenuRequestDTO> basketDtoList) {
        List<BasketMenu> newBasketMenu = new ArrayList<>();

        for (StoreBasketMenuRequestDTO basketDto : basketDtoList) {
            List<MenuOptionDTO> options = basketService.optionSeqToObject(basketDto.getOptionSeqList());
        }
        return newBasketMenu;
    }
}
