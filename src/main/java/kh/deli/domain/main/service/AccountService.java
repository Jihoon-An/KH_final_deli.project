package kh.deli.domain.main.service;

import kh.deli.domain.main.repository.AccountRepository;
import kh.deli.global.entity.AccountDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {
    @Autowired
    private AccountRepository accRp;

    public int sign(AccountDTO dto) throws Exception {
        return accRp.sign(dto);
    }
}