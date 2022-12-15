package kh.deli.domain.member.store.controller;

import kh.deli.domain.member.store.service.StoreSearchService;
import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@AllArgsConstructor
@RequestMapping("storeSearch")
public class StoreSearchController {

    private final HttpSession session;
    private final StoreSearchService storeSearchService;

    @RequestMapping("")
    public String selectDistanceByAccSeq(Model model) throws Exception {
        int acc_seq = (Integer) session.getAttribute("acc_seq");
        List<HashMap<String, Object>> storeList = storeSearchService.selectDistanceByAccSeq(acc_seq);
        model.addAttribute("store_List", storeList);
        return "member/store/storeSearch";
    }

    @RequestMapping("123")
    public String selectDistanceByAccSeq123(Model model) throws Exception {
        int acc_seq = (Integer) session.getAttribute("acc_seq");
        List<HashMap<String, Object>> storeList = storeSearchService.selectDistanceByAccSeq(acc_seq);
        model.addAttribute("store_List", storeList);
        return "member/store/storeSearch";
    }
}
