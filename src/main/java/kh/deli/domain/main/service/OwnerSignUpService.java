package kh.deli.domain.main.service;

import kh.deli.domain.main.mapper.AccountMapper;
import kh.deli.domain.main.mapper.OwnerSignUpMapper;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.OwnerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OwnerSignUpService {

    @Autowired
    private OwnerSignUpMapper ownerSignUpMapper;
    @Autowired
    private AccountMapper accountMapper;

    @Transactional
    public void signUp(OwnerDTO owner, AccountDTO account) throws Exception {
        int accSeq = accountMapper.getAccSeq();
        owner.setAcc_seq(accSeq);
        owner.setOwner_card_img("testSet");
        account.setAcc_seq(accSeq);
        ownerSignUpMapper.insert(owner);
        accountMapper.insertOwner(account);
    }
}