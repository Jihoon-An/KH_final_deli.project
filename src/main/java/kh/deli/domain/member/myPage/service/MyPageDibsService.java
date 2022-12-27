package kh.deli.domain.member.myPage.service;

import kh.deli.domain.member.myPage.dto.MyPageDibsDTO;
import kh.deli.domain.member.myPage.mapper.MyPageDibsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MyPageDibsService {

    @Autowired
    private MyPageDibsMapper myPageDibsMapper;

    public List<MyPageDibsDTO> select(int acc_seq) throws  Exception{
        return myPageDibsMapper.select(acc_seq);
    }

    public void insertDibs(int acc_seq,int store_seq) throws Exception{
        myPageDibsMapper.insertDibs(acc_seq,store_seq);
    }

    public void deleteDibs(int acc_seq,int store_seq) throws Exception{
        myPageDibsMapper.deleteDibs(acc_seq,store_seq);
    }

    public Integer isExistDibs(int acc_seq,int store_seq) throws Exception{
        return myPageDibsMapper.isExistDibs(acc_seq,store_seq);
    }
}
