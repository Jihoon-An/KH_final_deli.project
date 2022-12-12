package kh.deli.domain.main.service;

import kh.deli.domain.main.mapper.AccountMapper;
import kh.deli.domain.main.repository.AccountRepository;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.util.Encryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class AccountService {
    @Autowired
    private AccountMapper accountMapper;

    public int login(String email, String pw) throws Exception {
        Map<String, String> param = new HashMap<>();
        param.put("email", email);
        param.put("pw", pw);
//        param.put("pw", Encryptor.getSHA512(pw));
        return accountMapper.login(param);
    }

 
}