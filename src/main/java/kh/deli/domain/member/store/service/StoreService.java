package kh.deli.domain.member.store.service;

import kh.deli.domain.member.store.mapper.StoreMapper;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@AllArgsConstructor
public class StoreService {

    private  final StoreMapper storeMapper;

    public void  insertStore(StoreDTO dto) {
         storeMapper.insertStore(dto);
    }
}
