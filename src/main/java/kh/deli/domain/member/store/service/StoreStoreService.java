package kh.deli.domain.member.store.service;

import kh.deli.domain.member.store.mapper.StoreStoreMapper;
import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class StoreStoreService {

    private  final StoreStoreMapper storeMapper;

    public void  insertStore(StoreDTO dto) {
         storeMapper.insertStore(dto);
    }

    public StoreDTO storeInfo(int store_seq) throws Exception{
        return storeMapper.storeInfo(store_seq);
    }

    public MenuDTO menuInfo(int store_seq) throws Exception{
        return storeMapper.menuInfo(store_seq);
    }
}
