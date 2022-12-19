package kh.deli.domain.owner.service;

import kh.deli.domain.owner.dto.OwnerStoreInfoDTO;
import kh.deli.domain.owner.mapper.OwnerMainMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class OwnerMainService {

    @Autowired
    private OwnerMainMapper ownerMainMapper;

    public List<OwnerStoreInfoDTO> selectByOwner(int owner_seq) throws Exception {

    return ownerMainMapper.selectByOwner(owner_seq);
    }

//    public int selectSales(List<OwnerStoreInfoDTO> list) throws Exception{
//
//        for(int i=0;i<list.size();i++){
//            int store_seq=list.get(i).getStore_seq();
//            ownerMainMapper.selectSales(store_seq);
//        }
//
//        return ;
//    }


}
