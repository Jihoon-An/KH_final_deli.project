package kh.deli.domain.admin.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
@AllArgsConstructor
public class AdminMainController {

    //어드민 메인 페이지로 이동
    @RequestMapping("")
    public String toAdminMain() throws Exception {
        return "admin/adminMain";
    }

}
