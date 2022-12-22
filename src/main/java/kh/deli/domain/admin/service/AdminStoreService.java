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

    public AdminStoreDTO selectByStore_seq(int store_seq) throws Exception{

        return adminStoreMapper.selectByStore_seq(store_seq);
    }

}
