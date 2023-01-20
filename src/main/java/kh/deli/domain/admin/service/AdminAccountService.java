package kh.deli.domain.admin.service;


import kh.deli.domain.admin.dto.AdminAccountDTO;
import kh.deli.domain.admin.mapper.AdminAccountMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class AdminAccountService {

    private final AdminAccountMapper adminAccountMapper;

    public List<AdminAccountDTO> selectAccountList() {
        return adminAccountMapper.selectAccountList();
    }


    public int deleteAccount(int acc_seq) {
        return adminAccountMapper.deleteAccount(acc_seq);
    }
}
