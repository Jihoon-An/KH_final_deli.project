package kh.deli.domain.member.store.service;


import kh.deli.domain.member.store.mapper.StoreMenuMapper;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kh.deli.global.util.FileUtil;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
@AllArgsConstructor
public class StoreMenuService {

    private final HttpSession session;
    @Autowired
    private StoreMenuMapper storeMenuMapper;


    public void insertMenu(MenuDTO menu, MultipartFile file) throws IOException {


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

            menu.setMenu_img(sysName);
        }


        storeMenuMapper.insertMenu(menu);
    }

    public List<String> menuInfo(int store_seq) throws Exception{
        return storeMenuMapper.menuInfo(store_seq);
    }

    public List<MenuDTO> menuList(String menu_group,int store_seq) throws Exception{
        return storeMenuMapper.menuList(menu_group,store_seq);
    }


}
