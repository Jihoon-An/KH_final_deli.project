package kh.deli.domain.member.store.controller;


import kh.deli.global.entity.MenuDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@AllArgsConstructor
@RequestMapping("/menu")
public class MenuController {



    private final HttpSession session;



    @RequestMapping("optionModify")
    public void optionModify(){

    }
}
