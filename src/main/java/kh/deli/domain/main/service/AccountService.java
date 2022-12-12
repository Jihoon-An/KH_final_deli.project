package kh.deli.domain.main.service;

import kh.deli.domain.main.mapper.AccountMapper;
import kh.deli.global.entity.AccountDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class AccountService {
    @Autowired
    private AccountMapper accountMapper;


    public void sign(AccountDTO dto) throws Exception {
        accountMapper.insert(dto);
    }

    /**
     * <h2>email 중복체크</h2>
     *
     * @param email 검색할 email
     * @return 검색한 email이 있으면 true, 업으면 false
     */
    public boolean dupleCheck(String email) throws Exception {
        String result = accountMapper.findByEmail(email);

        if (result != null) {
            return true;
        }
        return false;
    }

    public int login(String email, String pw) throws Exception {
        Map<String, String> param = new HashMap<>();
        System.out.println(email + " ::: " + pw);
        param.put("email", email);
        param.put("pw", pw);
//        param.put("pw", Encryptor.getSHA512(pw));
        return accountMapper.login(param);
    }
    
    public void memberSignUp(AccountDTO dto) throws Exception {
        accountMapper.memberSignUp(dto);
    }

 
}