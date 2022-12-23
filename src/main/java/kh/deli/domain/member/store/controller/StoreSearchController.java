package kh.deli.domain.member.store.controller;


import kh.deli.domain.member.header.service.DestinationService;
import kh.deli.domain.member.store.service.StoreSearchService;
import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.MenuDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@AllArgsConstructor
@RequestMapping("/store/search")
public class StoreSearchController {

    private final HttpSession session;
    private final StoreSearchService storeSearchService;
    private final DestinationService destinationService;

    @RequestMapping("")
    public String selectDistanceByAccSeq(Model model, String search, String filter) throws Exception {
        int acc_seq = (Integer) session.getAttribute("acc_seq");
        List<Map<String, Object>> storeList = storeSearchService.selectDistanceByAccSeq(acc_seq, search, filter);
        List<Map<String, List<String>>> menuList = new ArrayList();
        for (int i = 0; i < storeList.size(); i++) {
            Object STORE_SEQ = storeList.get(i).get("STORE_SEQ");
            int int_STORE_SEQ = Integer.parseInt(String.valueOf(STORE_SEQ));
            List<MenuDTO> menuOne = storeSearchService.selectMenuListByStoreSeq(int_STORE_SEQ);
            Map<String, List<String>> map = new HashMap<>();

            if(menuOne.size() == 0) {
                map.put("menu_name", null);
                menuList.add(map);
            } else {
                ArrayList<String> list = new ArrayList<>();
                for (int num = 0; num < menuOne.size(); num++) {
                    String menuName = menuOne.get(num).getMenu_name();
                    list.add(menuName);
                }
                map.put("menu_name", list);
                menuList.add(map);
            }
        }


        List<AddressDTO> addressList = destinationService.selectAll(acc_seq);
        model.addAttribute("address_List", addressList);

        model.addAttribute("store_list", storeList);
        model.addAttribute("menu_list", menuList);
        return "member/store/storeSearch";
    }

}
