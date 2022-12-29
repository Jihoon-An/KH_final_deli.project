package kh.deli.domain.member.order.service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.order.dto.OrderBasketDTO;
import kh.deli.domain.member.order.dto.OrderBasketMenuDTO;
import kh.deli.domain.member.order.mapper.OrderBasketMapper;
import kh.deli.domain.member.order.mapper.OrderMenuMapper;
import kh.deli.domain.member.order.mapper.OrderOrdersMapper;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class OrderBasketService {
    private final OrderMenuOptionService optionService;
    private final OrderMenuService menuService;
    private final OrderStoreService storeService;
    private final OrderOrdersMapper orderOrdersMapper;
    private final OrderBasketMapper orderBasketMapper;
    private final OrderMenuMapper menuMapper;
    private final Gson gson;

    public StoreDTO findStoreBySeq(int storeSeq) throws Exception {
        return orderBasketMapper.findStoreBySeq(storeSeq);
    }

    public MenuDTO findMenuBySeq(int menuSeq) throws Exception {
        return orderBasketMapper.findMenuBySeq(menuSeq);
    }

    public MenuOptionDTO findMenuOptionBySeq(int optionSeq) throws Exception {
        return orderBasketMapper.findMenuOptionBySeq(optionSeq);
    }

    public void updateBasketInSession(HttpSession session, String BasketJson) {
        BasketDTO basketDTO = (BasketDTO) session.getAttribute("basket");
        Type type = new TypeToken<List<StoreBasketMenuRequestDTO>>() {}.getType();
        List<StoreBasketMenuRequestDTO> menuList = gson.fromJson(BasketJson, type);

        // 메뉴 리스트 수정
        basketDTO.setMenuList(menuList);
        // 총 주문 금액 수정
        basketDTO.setTotalPrice(this.getTotalPriceByMenuList(menuList));

        session.setAttribute("basket", basketDTO);
    }

    public void insertSampleBasket(String orderBasketDTO) throws Exception {
        orderOrdersMapper.insertSampleBasket(orderBasketDTO);
    }

    public OrderBasketDTO getSample() throws Exception {
        List<OrderBasketMenuDTO> menuList = new ArrayList<>();

        OrderBasketMenuDTO menu1 = new OrderBasketMenuDTO();
        OrderBasketMenuDTO menu2 = new OrderBasketMenuDTO();
        OrderBasketMenuDTO menu3 = new OrderBasketMenuDTO();

        menu1.setMenu(menuService.findBySeq(5));
        menu1.setOptions(optionService.findByMenuSeq(5));
        menu1.setCount(3);
        menu1.setPrice(this.getPrice(3, optionService.findByMenuSeq(5), menuService.findBySeq(5)));

        menuList.add(menu1);

        menu2.setMenu(menuService.findBySeq(4));
        menu2.setOptions(optionService.findByMenuSeq(4));
        menu2.setCount(1);
        menu2.setPrice(this.getPrice(1, optionService.findByMenuSeq(4), menuService.findBySeq(4)));

        menuList.add(menu2);

        menu3.setMenu(menuService.findBySeq(4));
        menu3.setOptions(optionService.findByMenuSeq(4));
        menu3.setCount(7);
        menu3.setPrice(this.getPrice(7, optionService.findByMenuSeq(4), menuService.findBySeq(4)));

        menuList.add(menu3);

        // total price 계산
        int total_price = this.getTotalPriceByOrderBasketMenuDtoList(menuList);

        OrderBasketDTO basket = new OrderBasketDTO();

        basket.setStore(storeService.findBySeq(16));
        basket.setMenuList(menuList);
        basket.setTotalPrice(total_price);

        return basket;
    }

    public int getPrice(int count, List<MenuOptionDTO> menuOptionDTOList, MenuDTO menuDTO) {
        int price = menuDTO.getMenu_price();
        for (MenuOptionDTO option : menuOptionDTOList) {
            price += option.getOption_price();
        }
        return price * count;
    }

    public int getTotalCount(List<StoreBasketMenuRequestDTO> storeBasketMenuRequestDTOList) {
        int totalCount = 0;

        for (StoreBasketMenuRequestDTO menu : storeBasketMenuRequestDTOList) {
            totalCount += menu.getCount();
        }
        return totalCount;
    }

    public int getTotalPriceByOrderBasketMenuDtoList(List<OrderBasketMenuDTO> menuList) {

        int totalPrice = 0;

        for (OrderBasketMenuDTO menu : menuList) {
            int onePrice = 0;
            onePrice += menu.getMenu().getMenu_price();
            for (MenuOptionDTO option : menu.getOptions()) {
                onePrice += option.getOption_price();
            }
            totalPrice += onePrice * menu.getCount();
        }

        return totalPrice;
    }

    public int getTotalPriceByMenuList(List<StoreBasketMenuRequestDTO> menuList) {
        int totalPrice = 0;

        for (StoreBasketMenuRequestDTO menu : menuList) {

            int menuPrice = menu.getPrice() * menu.getCount();

            totalPrice += menuPrice;
        }

        return totalPrice;
    }

    public List<MenuOptionDTO> optionSeqListToObject(List<Integer> optionSeqList) {
        if (optionSeqList.size() > 0) {
            String seqListStr = optionSeqList.toString();

            seqListStr = seqListStr.replace("[", "(");
            seqListStr = seqListStr.replace("]", ")");

            List<MenuOptionDTO> optionsListObject = optionService.seqListToObject(seqListStr);

            return optionsListObject;
        }
        return new ArrayList<>();
    }
}
