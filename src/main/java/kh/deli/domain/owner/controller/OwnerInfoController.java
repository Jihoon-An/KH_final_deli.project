package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.service.OwnerInfoService;
import kh.deli.global.entity.OwnerDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("/owner/info")
public class OwnerInfoController {

    private final HttpSession session;
    private final OwnerInfoService ownerInfoService;

    @RequestMapping("")
    public String toOwnerInfo(Model model) throws Exception {
        int accSeq = (int) session.getAttribute("acc_seq");
        String email = ownerInfoService.findEmailBySeq(accSeq);
        OwnerDTO ownerDTO = ownerInfoService.findOwnerInfoBySeq(accSeq);

        model.addAttribute("acc_email", email);
        model.addAttribute("ownerInfo", ownerDTO);

        return "/owner/ownerInfo";
    }

    @ResponseBody
    @PostMapping("/modifyPassWord")
    public String modifyPassWord(String oldPassWord, String newPassWord) throws Exception {
        int accSeq = (int) session.getAttribute("acc_seq");
        boolean result = ownerInfoService.modifyAccountPW(accSeq, oldPassWord, newPassWord);
        if (result) {return "true";}else {return "false";}
    }

}
