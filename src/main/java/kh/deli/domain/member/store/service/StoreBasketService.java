package kh.deli.domain.member.store.service;

import com.google.gson.Gson;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.store.dto.Basket;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.domain.member.store.dto.BasketMenu;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.util.checker.CheckerService;
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
    private final CheckerService checkerService;

    public Integer setBasketInSession(HttpSession session,String newMenuJson)  throws ParseException {
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
//            basket.getMenuList().add(
//                    gson.fromJson(newMenuJson, StoreBasketMenuRequestDTO.class)
//            );
            StoreBasketMenuRequestDTO newMenu = gson.fromJson(newMenuJson, StoreBasketMenuRequestDTO.class);
            // storeSeq 일치 검사.
            if(basket.getStoreSeq() != newMenu.getStoreSeq()){
                throw new RuntimeException("여러 가게의 메뉴를 장바구니에 담을 수 없습니다.");
            }

            // 기존 메뉴에 있는지 검사
            List<StoreBasketMenuRequestDTO> oldMenuList = basket.getMenuList();

            Integer newMenuSeq = newMenu.getMenuSeq();
            List<Integer> newOptionSeqList = newMenu.getOptionSeqList();

            for (StoreBasketMenuRequestDTO oldMenu : oldMenuList) {
                if (oldMenu.getMenuSeq() != newMenuSeq) {
                    basket.getMenuList().add(newMenu);
                    break;
                }
                if (oldMenu.getOptionSeqList().equals(newOptionSeqList)) {
                    // 기존에 장바구니에 있는 메뉴이면..
                    oldMenu.setCount(oldMenu.getCount() + newMenu.getCount());
//                    // 저장
//                    basket.setTotalPrice(basketService.getTotalPriceByMenuList(basket.getMenuList()));
//                    session.setAttribute("basket", basket);
                    break;
                }
            }


            // 저장
            basket.setTotalPrice(basketService.getTotalPriceByMenuList(basket.getMenuList()));
            session.setAttribute("basket", basket);

        }

        return basketMenu.getStoreSeq();
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
        List<BasketMenu> newBasketMenuList = new ArrayList<>();

        for (StoreBasketMenuRequestDTO basketDto : basketDtoList) {
            List<MenuOptionDTO> options = basketService.optionSeqListToObject(basketDto.getOptionSeqList());

            MenuDTO menu = menuService.findBySeq(basketDto.getMenuSeq());

            newBasketMenuList.add(BasketMenu.builder()
                    .menu(menu)
                    .optionList(options)
                    .count(basketDto.getCount())
                    .price(basketDto.getPrice())
                    .build());
        }
        return newBasketMenuList;
    }
}
