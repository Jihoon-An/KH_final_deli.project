package kh.deli.domain.owner.controller;

import io.lettuce.core.ScriptOutputType;
import kh.deli.domain.owner.service.OwnerStoreService;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@AllArgsConstructor
@RequestMapping("owner/store/add")
public class StoreAddController {


    private final HttpSession session;

    private final OwnerStoreService storeService;

    @RequestMapping("")
    public String toAdd(){
        return "/owner/storeAdd";
    }
    @RequestMapping("/storeAdd")
    public String add(StoreDTO dto, MultipartFile file, int acc_seq) throws IOException {

        System.out.println("ACC"+acc_seq);
//        System.out.println(dto.getStore_bsns_hours());
//        System.out.println(dto.getStore_name());
//
//        System.out.println(dto.getStore_deli_tip());
//        System.out.println(file);
//        System.out.println(dto.getStore_add_x());
//        System.out.println(dto.getStore_add_y());
//        System.out.println(dto.getStore_close_day());
//        System.out.println(dto.getStore_deli_time());
//        System.out.println(dto.getStore_destination());
//        System.out.println(dto.getStore_deli_tip());
//        System.out.println(dto.getStore_display()+"공개여부");
//        System.out.println(dto.getStore_open()+"품절여부");

       // int owner_Seq = (Integer) session.getAttribute("owner_seq");
     
//        int owner_Seq=12;
//        dto.setOwner_seq(owner_Seq);  //임시

        int owner_seq = storeService.selectOwnerSeq(acc_seq); //acc_seq로 owner_seq 조히
        System.out.println(owner_seq);
        dto.setOwner_seq(owner_seq); //owner_seq dq입력


        String realPath=session.getServletContext().getRealPath("/resources/img/store");
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

        return "redirect:/owner/store/list";
    }
}
