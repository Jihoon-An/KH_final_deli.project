package kh.deli.domain.owner.service;

import kh.deli.domain.owner.mapper.OwnerStoreMapper;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.OwnerDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class OwnerStoreService {

    private  final OwnerStoreMapper storeMapper;

    public void  insertStore(StoreDTO dto) {
         storeMapper.insertStore(dto);
    }

    public StoreDTO storeInfo(int store_seq) throws Exception{
        return storeMapper.storeInfo(store_seq);
    }



}
