package kh.deli.domain.member.order.controller;

import com.google.gson.Gson;
import kh.deli.domain.member.order.dto.OrderDetailDTO;
import kh.deli.domain.member.order.service.OrderBasketService;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/basket")
public class BasketController {

    private final OrderBasketService basketService;
    private final HttpSession session;
    private final Gson gson;

    @RequestMapping("")
    public String toBasket(Model model) throws Exception {

        // Session 에서 BasketDTO 뽑아내기
        BasketDTO basketDTO = (BasketDTO) session.getAttribute("basket");

        if (basketDTO != null) {

            // BasketDTO 에서 뽑아낸 store_seq 로 StoreDTO 불러오기
            StoreDTO storeDTO = basketService.findStoreBySeq(basketDTO.getStoreSeq());

            List<OrderDetailDTO> orderDetailDTOList = new ArrayList<>();

            for (int i = 0; basketDTO.getMenuList().size() > i; i++) {

                // BasketDTO > MenuList 에서 뽑아낸 menu_seq 로 MenuDTO 불러오기
                MenuDTO menuDTO = basketService.findMenuBySeq(basketDTO.getMenuList().get(i).getMenuSeq());

                List<MenuOptionDTO> menuOptionDTOList = new ArrayList<>();

                for (int k = 0; basketDTO.getMenuList().get(i).getOptionSeqList().size() > k; k++) {
                    // BasketDTO > MenuList > MenuOptionList 에서 뽑아낸 option_seq 로 MenuOptionDTO 불러오기
                    MenuOptionDTO menuOptionDTO = basketService.findMenuOptionBySeq(
                            basketDTO.getMenuList().get(i).getOptionSeqList().get(k)
                    );

                    // MenuOptionDTO 리스트에 MenuOptionDTO 담기
                    menuOptionDTOList.add(menuOptionDTO);
                }
                int count = basketDTO.getMenuList().get(i).getCount(); // BasketDTO > MenuList 에서 뽑아낸 Count
                int price = (basketDTO.getMenuList().get(i).getPrice()) * count; // BasketDTO > MenuList 에서 뽑아낸 Price

                OrderDetailDTO orderDetailDTO = new OrderDetailDTO(menuDTO, menuOptionDTOList, count, price);
                orderDetailDTOList.add(orderDetailDTO);
            }


            int totalPrice = basketDTO.getTotalPrice(); // 장바구니에 담긴 메뉴 + 옵션 들 총 가격
            int deliveryTip = storeDTO.getStore_deli_tip(); // 배달팁
            int totalCount = basketService.getTotalCount(basketDTO.getMenuList()); // 장바구니에 담긴 메뉴들 총 수량

            model.addAttribute("store", storeDTO); // 가게 정보
            model.addAttribute("basket", orderDetailDTOList); // 장바구니 품목
            model.addAttribute("totalPrice", totalPrice); // 메뉴 + 옵션 총 가격
            model.addAttribute("payAmount", (totalPrice + deliveryTip)); // 결제 예정 금액
            model.addAttribute("totalCount", totalCount); // 메뉴 총 수량

        }

        return "member/order/basket";
    }

    @ResponseBody
    @RequestMapping("/updateMenu")
    public String updateBasketMenu(@RequestParam("basketMenuList") String basketJson) throws Exception {
        basketService.updateBasketInSession(session, basketJson);
        return "";
    }


}

