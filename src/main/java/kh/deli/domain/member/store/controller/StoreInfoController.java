package kh.deli.domain.member.store.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store/info")
@AllArgsConstructor
public class StoreInfoController {

    @RequestMapping()
    public String storeInfo() throws Exception{
        return "/member/store/storeInfo";
    }
}
