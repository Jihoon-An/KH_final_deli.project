package kh.deli.domain.member.store.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import kh.deli.global.entity.StoreDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.Multipart;
import java.util.HashMap;

@Controller
@RequestMapping("store")
public class StoreController {

    @RequestMapping("toStoreAdd")
    public String toAdd(){
        return "member/store/storeAdd";
    }
    @RequestMapping("add")
    public String add(@RequestBody HashMap<String, Object> param, Multipart multipart){
        System.out.println(param);
        return "redirect:/";
    }
}
