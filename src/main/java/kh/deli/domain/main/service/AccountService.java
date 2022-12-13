package kh.deli.domain.main.service;

import kh.deli.domain.main.mapper.AccountMapper;
import kh.deli.global.entity.AccountDTO;
import org.springframework.stereotype.Service;

@Service
public class AccountService {

    private AccountMapper accountMapper;

    public void insert(AccountDTO dto) throws Exception {
        accountMapper.insert(dto);
    }
}