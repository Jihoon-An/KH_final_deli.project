package kh.deli.domain.owner.controller;

import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.domain.owner.service.OwnerStoreService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/owner/store/list")
public class OwnerStoreListController {

    private final OwnerStoreService ownerStoreService;
    private final StoreStoreService storeStoreService;

    private final HttpSession session;

    @GetMapping("")
    public String toPage(Model model) throws Exception {
        int acc_seq = (Integer) session.getAttribute("acc_seq");
        List<StoreDTO> storeList=ownerStoreService.findByAccSeq(acc_seq);

        if (storeList.size() == 0) {
            return "redirect:/owner/store/add";
        }

        model.addAttribute("list",storeList);

        return "/owner/storeList";
    }

    @PostMapping("delete")
    public String delStore(@RequestParam("store_seq") int storeSeq) throws Exception {
        storeStoreService.deleteStore(storeSeq);

        return "redirect:/owner/store/list";
    }

    @PostMapping("displayToggle")
    @ResponseBody
    public void displayToggle(int storeSeq, String newVal) {
        ownerStoreService.toggleDisplay(storeSeq, newVal);
    }

}
