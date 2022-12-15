package kh.deli.domain.member.store.controller;

import kh.deli.domain.member.store.service.StoreStoreService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
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

}
