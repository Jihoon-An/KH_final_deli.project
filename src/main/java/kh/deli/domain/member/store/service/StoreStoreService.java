package kh.deli.domain.member.store.service;

import kh.deli.domain.member.store.mapper.StoreStoreMapper;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class StoreStoreService {

    private final StoreStoreMapper storeMapper;


    public void insertStore(StoreDTO dto) {
        storeMapper.insertStore(dto);
    }

    //가게 정보
    public StoreDTO storeInfo(int store_seq) throws Exception {
        return storeMapper.storeInfo(store_seq);
    }
    
    //식당 삭제
    public int deleteStore(int store_seq) throws Exception {
        return storeMapper.deleteStore(store_seq);
    }


    public StoreDTO findBySeq(int seq) {
        StoreDTO store = storeMapper.findBySeq(seq);
        return store;
    }
}
