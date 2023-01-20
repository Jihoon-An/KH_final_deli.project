package kh.deli.domain.admin.controller;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import io.lettuce.core.ScriptOutputType;
import kh.deli.domain.admin.dto.AdminOwnerDTO;
import kh.deli.domain.admin.service.AdminOwnerService;
import kh.deli.domain.main.service.MainAccountService;
import kh.deli.global.entity.StoreDTO;
import kh.deli.global.util.FileUtil;
import lombok.AllArgsConstructor;
import org.apache.coyote.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.Reader;
import java.lang.reflect.Type;
import java.util.List;
@AllArgsConstructor
@Controller
@RequestMapping("/admin/owner/list")
public class OwnerListController {

    private  final AdminOwnerService adminOwnerService;
    private final MainAccountService mainAccountService;
    private final HttpSession session;
    @RequestMapping("")
    public String toAdminOwner(Model model){
        List<AdminOwnerDTO> owner_list = adminOwnerService.selectOwnerList();

        model.addAttribute("owner_list", owner_list);
        return "admin/adminOwnerList";
    }

    @RequestMapping("/deleteOwner")
    public String deleteOwner(int owner_seq, int acc_seq) throws Exception {

        return "redirect:";
    }
}
