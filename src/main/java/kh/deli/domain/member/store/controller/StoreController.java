package kh.deli.domain.member.store.controller;

import kh.deli.domain.member.store.service.StoreStoreService;
import kh.deli.global.entity.StoreDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("store")
public class StoreController {


    @Autowired
    private HttpSession session;
    @Autowired
    private StoreStoreService storeService;

    @RequestMapping("toStoreAdd")
    public String toAdd(){
        return "member/store/storeAdd";
    }
    @RequestMapping("add")
    public String add(StoreDTO dto, MultipartFile file ) throws IOException {

        System.out.println(dto.getStore_name());
        System.out.println(dto.getStore_bsns_hours());
        System.out.println(dto.getStore_deli_tip());
        System.out.println(file);
        System.out.println(dto.getStore_add_x());
        System.out.println(dto.getStore_add_y());
        System.out.println(dto.getStore_close_day());
        System.out.println(dto.getStore_deli_time());
        System.out.println(dto.getStore_destination());
        System.out.println(dto.getStore_deli_tip());
        System.out.println(dto.getStore_display()+"공개여부");
        System.out.println(dto.getStore_open()+"품절여부");




        String realPath=session.getServletContext().getRealPath("/resources/profile");
        File filePath=new File(realPath);
        if(!filePath.exists()) {
            filePath.mkdir(); //파일업로드 폴더가 없다면 생성
        }

        if(file.getSize()!=0) {//파일 사이즈가0이 아니라면
            String oriName=file.getOriginalFilename();
            //겹치지 않게 이름을 만들어야함
            String sysName= UUID.randomUUID()+"_"+oriName;
            file.transferTo(new File(filePath+"/"+sysName));
            System.out.println("파일있을떄");

            dto.setStore_logo(sysName);
        }

       storeService.insertStore(dto);

        return "redirect:/";
    }
}
