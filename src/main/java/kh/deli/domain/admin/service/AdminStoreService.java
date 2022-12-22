package kh.deli.domain.admin.service;

import kh.deli.domain.admin.dto.AdminStoreDTO;
import kh.deli.domain.admin.mapper.AdminStoreMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class AdminStoreService {

    private final AdminStoreMapper adminStoreMapper;

    public List<AdminStoreDTO> selectAllStore() throws Exception{

        return adminStoreMapper.selectAllStore();
    }

    public void deleteByStoreSeq(int store_seq) throws Exception{

       adminStoreMapper.deleteByStoreSeq(store_seq);
    }

}
