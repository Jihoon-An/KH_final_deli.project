package kh.deli.domain.owner.service;

import kh.deli.domain.owner.mapper.OwnerStoreMapper;

import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@AllArgsConstructor
public class OwnerStoreService {

    private  final OwnerStoreMapper ownerStoreMapper;
    private final HttpSession session;

    public void  insertStore(StoreDTO dto) {
        ownerStoreMapper.insertStore(dto);
    }

    public StoreDTO storeInfo(int store_seq) throws Exception{
        return ownerStoreMapper.storeInfo(store_seq);
    }

    //식당 수정
    public int modifyStore(StoreDTO storeDTO, Integer store_seq, MultipartFile file) throws Exception {

        String realPath=session.getServletContext().getRealPath("/resources/store");
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

            storeDTO.setStore_logo(sysName);
        }

        Map<String, Object> param = new HashMap<>();
        param.put("StoreDTO", storeDTO);
        param.put("store_seq", store_seq);
        param.put("file",file);
        return ownerStoreMapper.modifyStore(param);
    }

}
