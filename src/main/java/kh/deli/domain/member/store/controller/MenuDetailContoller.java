package kh.deli.domain.member.store.controller;

import com.google.gson.Gson;
import kh.deli.domain.member.store.service.StoreBasketService;
import kh.deli.domain.member.store.service.StoreMenuOptionService;
import kh.deli.domain.member.store.service.StoreMenuService;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@AllArgsConstructor
@RequestMapping("menu/detail")
public class MenuDetailContoller {

    private final StoreMenuService menuService;
    private final StoreMenuOptionService optionService;
    private final StoreBasketService basketService;

    private final HttpSession session;

    private final Gson gson;

    /**
     * <h2>Request에 menuSeq 또는 menu_seq를 담아서 보내면 해당 메뉴의 상세페이지 출력</h2>
     */
    @RequestMapping("")
    public String toMenuDetail(Integer menuSeq, Integer menu_seq, Model model) {

        Optional<Integer> optional = Optional.ofNullable(menuSeq);
        menuSeq = optional.orElse(Optional.ofNullable(menu_seq).orElse(0));

        MenuDTO menu = menuService.findBySeq(menuSeq);
        List<MenuOptionDTO> menuOptionList = optionService.findByMenuSeq(menuSeq);
        Map<String, List<Map<String, Object>>> menuOptions = optionService.toMap(menuOptionList);


        model.addAttribute("menu", menu);
        model.addAttribute("menuJson", gson.toJson(menu));
        model.addAttribute("menuOptions", menuOptions);
        model.addAttribute("OptionsJson", gson.toJson(menuOptions));

        return "member/store/menuDetail";
    }

    @RequestMapping("put")
    public String putBasket(
            @RequestParam("basket_menu") String menuJson
    ) {
        basketService.setBasketInSession(session, menuJson);

        return "redirect:/store/info";
    }
}
