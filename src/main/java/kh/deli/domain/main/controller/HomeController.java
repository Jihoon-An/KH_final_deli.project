package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.MainAccountService;
import kh.deli.domain.member.store.service.StoreSearchService;
import kh.deli.domain.owner.dto.OwnerDailySalesDTO;
import kh.deli.domain.owner.dto.OwnerStoreInfoDTO;
import kh.deli.domain.owner.service.OwnerMainService;
import kh.deli.global.entity.MenuDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@AllArgsConstructor
public class HomeController {


    private final HttpSession session;
    private final OwnerMainService ownerMainService;
    private final StoreSearchService storeSearchService;

    private final MainAccountService mainAccountService;



    @RequestMapping("/")
    public String toHome(@CookieValue(value = "saved_email", required = false) String saved_email, Model model,String search, String filter) throws Exception {
        // @CookieValue 를 통해 쿠키 값 불러와 String 에 담기
        // required = false 안 하면 NullPointException

        if (session.getAttribute("acc_seq")!=null) {
            int acc_seq = (Integer) session.getAttribute("acc_seq");
            String acc_type = mainAccountService.selectType(acc_seq);

            //toMemberMainPage
            if (acc_type.equals("client")) {
                List<Map<String, Object>> storeList = storeSearchService.selectDistanceByAccSeq(acc_seq,search, filter);
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
                model.addAttribute("store_list", storeList);
                model.addAttribute("menu_list", menuList);
                return "main/memberMain";
            }

            //toOwnerMainPage
            if (acc_type.equals("business")) {
                int owner_seq=ownerMainService.selectOwnerSeq(acc_seq);
                List<OwnerStoreInfoDTO> list=ownerMainService.selectByOwner(owner_seq);
                List<OwnerDailySalesDTO> dslist=ownerMainService.selectSales(list);
                int total= ownerMainService.calcul(dslist);

                model.addAttribute("total",total);
                model.addAttribute("dslist",dslist);
                model.addAttribute("list", list);
                return "owner/ownerMain";
            }
        }

        model.addAttribute("saved_email", saved_email);
        return "main/home";
    }


}
