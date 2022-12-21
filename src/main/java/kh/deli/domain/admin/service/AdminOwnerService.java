package kh.deli.domain.admin.service;


import kh.deli.domain.admin.dto.AdminOwnerDTO;
import kh.deli.domain.admin.mapper.AdminOwnerMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class AdminOwnerService {


   private final AdminOwnerMapper adminOwnerMapper; //초기화한 값을 끝까지 유지하기 위해 privat final사용


    public List<AdminOwnerDTO> selectOwnerList(){
       return adminOwnerMapper.selectOwnerList();
    }

    public int deleteOwner(int owner_seq){
        return adminOwnerMapper.deleteOwner(owner_seq);
    }
}
