package kh.deli.domain.main.repository;

import kh.deli.global.entity.AccountDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class AccountRepository {

    @Autowired
    private SqlSession db;

    public int login(Map<String, String> param) throws Exception {
        return db.selectOne("Account.login", param);
    }

    public int sign(AccountDTO dto) throws Exception {
        return db.insert("Account.insert", dto);
    }
}
