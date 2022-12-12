package kh.deli.domain.main.repository;

import kh.deli.domain.main.mapper.AccountMapper;
import kh.deli.domain.main.mapper.OwnerSignUpMapper;
import kh.deli.global.entity.AccountDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountRepository {

    @Autowired
    private AccountMapper accountMapper;

    public void memberSignUp(AccountDTO dto) throws Exception {
        accountMapper.memberSignUp(dto);
    }
}
