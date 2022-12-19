package kh.deli.domain.main.controller;

import kh.deli.domain.main.service.MemberMainService;
import kh.deli.domain.owner.dto.OwnerStoreInfoDTO;
import kh.deli.domain.owner.service.OwnerMainService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
public class HomeController {


    private final HttpSession session;
    private final MemberMainService memberMainService;
    private final OwnerMainService ownerMainService;



    @RequestMapping("/")
    public String toHome(@CookieValue(value = "saved_email", required = false) String saved_email, Model model) throws Exception {
        // @CookieValue 를 통해 쿠키 값 불러와 String 에 담기
        // required = false 안 하면 NullPointException

        if (session.getAttribute("acc_seq")!=null) {
            int acc_seq = (Integer) session.getAttribute("acc_seq");
            String acc_type = memberMainService.selectType(acc_seq);

            //toMemberMainPage
            if (acc_type.equals("client")) {
                List<StoreDTO> list = memberMainService.selectAll();

                List<Integer> starlist=memberMainService.carry(list);

                model.addAttribute("starlist",starlist);
                model.addAttribute("list", list);
                return "main/memberMain";
            }

            //toOwnerMainPage
            if (acc_type.equals("business")) {
                int owner_seq=10;
                List<OwnerStoreInfoDTO> list=ownerMainService.selectByOwner(owner_seq);
//                OwnerMainService.selectSales(list);

                model.addAttribute("list", list);
                return "owner/ownerMain";
            }
        }

        model.addAttribute("saved_email", saved_email);
        return "main/home";
    }


}
