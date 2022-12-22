package kh.deli.domain.owner.service;


import ch.qos.logback.core.net.SyslogOutputStream;
import kh.deli.domain.owner.mapper.OwnerMenuMapper;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.MenuOptionDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.batch.core.configuration.xml.ExceptionElementParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
@AllArgsConstructor
public class OwnerMenuService {

    private final HttpSession session;
    @Autowired
    private static OwnerMenuMapper ownerMenuMapper;


    @Transactional
    public void insertMenu(MenuDTO menuDTO,  MultipartFile file, int menu_seq) throws IOException {

       //메뉴seq 생성
        String realPath=session.getServletContext().getRealPath("/resources/img/menu-img");
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

            menuDTO.setMenu_img(sysName);
        }
          menuDTO.setMenu_seq(menu_seq); //메뉴seq
        ownerMenuMapper.insertMenu(menuDTO);



    } ///메뉴 insert문
    public void insertMenuOption(MenuOptionDTO menuOptionDTO) throws  Exception{

        System.out.println(menuOptionDTO.getOption_group());
         //메뉴옵션에 메뉴seq
        ownerMenuMapper.insertMenuOption(menuOptionDTO);
    }
    // 메뉴 수정 진행중
    public void modifyMenu(MenuDTO menuDTO, MultipartFile file, int menu_seq) throws IOException {

        String realPath=session.getServletContext().getRealPath("/resources/img/menu-img");
        File filePath=new File(realPath);
        if(!filePath.exists()) {
            filePath.mkdir(); //파일업로드 폴더가 없다면 생성
        }

        if(file.getSize()!=0) {//파일 사이즈가0이 아니라면
            String oriName=file.getOriginalFilename();
            //겹치지 않게 이름을 만들어야함
            String sysName= UUID.randomUUID()+"_"+oriName;
            file.transferTo(new File(filePath+"/"+sysName));

            menuDTO.setMenu_img(sysName);
        }
        menuDTO.setMenu_seq(menu_seq); //메뉴seq
        ownerMenuMapper.modifyMenu(menuDTO);
    }

    public List<String> menuInfo(int store_seq) throws Exception{
        return ownerMenuMapper.menuInfo(store_seq);
    }

    public List<MenuDTO> menuList(String menu_group,int store_seq) throws Exception{
        return ownerMenuMapper.menuList(menu_group,store_seq);
    }

    public int getNextMenuSeq(){

      return  ownerMenuMapper.getNextMenuSeq();
    }



}
