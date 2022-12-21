package kh.deli.domain.member.myPage.service;

import kh.deli.domain.member.myPage.mapper.MyPageMemberInfoMapper;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.MemberDTO;
import kh.deli.global.util.Encryptor;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@AllArgsConstructor
public class MyPageMemberInfoService {

    private final MyPageMemberInfoMapper myPageMemberInfoMapper;

    public AccountDTO getAccountInfo(int accSeq) throws Exception {
        AccountDTO accountDTO = myPageMemberInfoMapper.findAccountInfoBySeq(accSeq);
        return accountDTO;
    }

    public MemberDTO getMemberInfo(int accSeq) throws Exception {
        MemberDTO memberDTO = myPageMemberInfoMapper.findMemberInfoBySeq(accSeq);
        return memberDTO;
    }

    public void modifyMemberInfo(MemberDTO memberDTO) throws Exception {
        myPageMemberInfoMapper.modifyMemberInfo(memberDTO);
    }

    public boolean modifyAccountPW(int accSeq, String oldPassWord, String newPassWord) throws Exception {
        Map<String, Object> oldParam = new HashMap<>();
        oldParam.put("acc_pw", Encryptor.getSHA512(oldPassWord));
        oldParam.put("acc_seq", accSeq);
        int checkOldPassWordResult = myPageMemberInfoMapper.checkOldPassWord(oldParam);

        if (checkOldPassWordResult == 1) {
            Map<String, Object> newParam = new HashMap<>();
            newParam.put("acc_pw", Encryptor.getSHA512(newPassWord));
            newParam.put("acc_seq", accSeq);
            myPageMemberInfoMapper.modifyAccountPW(newParam);
            return true;
        }else {
            return false;
        }
    }

}
