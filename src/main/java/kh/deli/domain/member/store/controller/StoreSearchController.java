package kh.deli.domain.member.store.controller;

import kh.deli.domain.member.store.service.StoreStoreService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@AllArgsConstructor
@RequestMapping("storeSearch")
public class StoreSearchController {

    private final HttpSession session;
    private final StoreStoreService storeService;

    @RequestMapping("")
    public String toAdd(){
        return "member/store/storeSearch";
    }

//    @RequestMapping("123")
//    public String selectAll(Model model) throws Exception {
//        int acc_seq = (Integer) session.getAttribute("acc_seq");
//        List<AddressDTO> addressList = storeService.selectAll(acc_seq);
////        List<AddressDTO> addressList = destinationService.selectAll(acc_seq);
//
//        model.addAttribute("address_List", addressList);
//        return "/member/header/destination";
//    }
}
