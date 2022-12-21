package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.dto.OrderBasketDTO;
import kh.deli.domain.member.order.dto.OrderBasketMenuDTO;
<<<<<<< HEAD
import kh.deli.domain.member.order.mapper.OrderBasketMapper;
=======
import kh.deli.domain.member.order.mapper.OrderMenuMapper;
>>>>>>> 8c63e4a2be1ce64b1fe3312a94905af5583f78f8
import kh.deli.domain.member.order.mapper.OrderOrdersMapper;
import kh.deli.domain.member.store.dto.StoreBasketMenuRequestDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

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

    public StoreDTO findStoreBySeq(int storeSeq) throws Exception {
        return orderBasketMapper.findStoreBySeq(storeSeq);
    }
    public MenuDTO findMenuBySeq(int menuSeq) throws Exception {
        return orderBasketMapper.findMenuBySeq(menuSeq);
    }
    public MenuOptionDTO findMenuOptionBySeq(int optionSeq) throws Exception {
        return orderBasketMapper.findMenuOptionBySeq(optionSeq);
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

    public int getTotalCount(List<OrderBasketMenuDTO> orderBasketMenuDTOList) {
        int totalCount = 0;

        for (OrderBasketMenuDTO menu : orderBasketMenuDTOList) {
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

        return  totalPrice;
    }

    public int getTotalPriceByMenuList(List<StoreBasketMenuRequestDTO> menuList){
        int totalPrice = 0;

        for (StoreBasketMenuRequestDTO menu : menuList) {

            int menuPrice = menu.getPrice() * menu.getCount();

            totalPrice += menuPrice;
        }

        return  totalPrice;
    }
}
