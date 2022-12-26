package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.service.OwnerStoreService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/store/list")
public class OwnerStoreListController {

    private final OwnerStoreService ownerStoreService;

    private final HttpSession session;

    @RequestMapping("")
    public String toStoreMng(Model model) throws Exception {

        int acc_seq = (Integer) session.getAttribute("acc_seq");
        int owner_seq=ownerStoreService.selectOwnerByAcc(acc_seq);
        List<StoreDTO> list=ownerStoreService.selectAllByOwner((owner_seq));

        model.addAttribute("list",list);

        return "/owner/storeList";
    }


}
