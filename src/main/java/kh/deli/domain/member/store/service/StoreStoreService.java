package kh.deli.domain.member.store.service;

import kh.deli.domain.member.store.mapper.StoreStoreMapper;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class StoreStoreService {

    private  final StoreStoreMapper storeMapper;

    public void  insertStore(StoreDTO dto) {
         storeMapper.insertStore(dto);
    }
}
