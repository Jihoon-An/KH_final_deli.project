package kh.deli.domain.member.store.service;

import kh.deli.domain.member.store.mapper.StoreStoreMapper;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    //식당 수정
    public int modifyStore(StoreDTO storeDTO, Integer store_seq) throws Exception {
        Map<String, Object> param = new HashMap<>();
        param.put("StoreDTO", storeDTO);
        param.put("store_seq", store_seq);
        return storeMapper.modifyStore(param);
    }

}
