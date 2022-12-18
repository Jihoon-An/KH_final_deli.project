package kh.deli.domain.member.myPage.service;

import kh.deli.domain.member.myPage.mapper.MyPageMemberInfoMapper;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.MemberDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

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

}
