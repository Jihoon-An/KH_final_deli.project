package kh.deli.domain.main.service;

import kh.deli.domain.main.mapper.AccountMapper;
import kh.deli.domain.main.mapper.OwnerMapper;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.OwnerDTO;
import kh.deli.global.util.Encryptor;
import kh.deli.global.util.FileUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Service
@AllArgsConstructor
public class OwnerService {

    private final HttpSession session;
    private final OwnerMapper ownerMapper;
    private final AccountMapper accountMapper;

    @Transactional
    public void signUp(OwnerDTO owner, AccountDTO account, MultipartFile file) throws Exception {
        FileUtil fileUtil = new FileUtil();

        int accSeq = accountMapper.getAccSeq();

        String path = "/resources/img/owner-card/";
        String sysName = fileUtil.save(session, path, file);
        owner.setOwner_card_img(sysName);

        owner.setAcc_seq(accSeq);

        ownerMapper.put(owner);

        account.setAcc_seq(accSeq);
        account.setAcc_pw(Encryptor.getSHA512(account.getAcc_pw()));

        accountMapper.insertOwner(account);
    }
}
