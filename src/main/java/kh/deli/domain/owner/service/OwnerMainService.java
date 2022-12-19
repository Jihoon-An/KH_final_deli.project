package kh.deli.domain.owner.service;

import kh.deli.domain.owner.dto.OwnerStoreInfoDTO;
import kh.deli.domain.owner.mapper.OwnerMainMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class OwnerMainService {

    @Autowired
    private OwnerMainMapper ownerMainMapper;


    public List<OwnerStoreInfoDTO> selectByOwner(int owner_seq) throws Exception {

    return ownerMainMapper.selectByOwner(owner_seq);
    }


}
