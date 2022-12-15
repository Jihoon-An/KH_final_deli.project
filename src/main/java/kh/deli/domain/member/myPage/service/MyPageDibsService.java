package kh.deli.domain.member.myPage.service;

import kh.deli.domain.member.myPage.dto.MyPageDibsDTO;
import kh.deli.domain.member.myPage.mapper.MyPageDibsMapper;
import kh.deli.global.entity.DibsDTO;
import kh.deli.global.entity.StoreDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyPageDibsService {

    @Autowired
    private MyPageDibsMapper myPageDibsMapper;

    public List<MyPageDibsDTO> select(int acc_seq) throws  Exception{
        return myPageDibsMapper.select(acc_seq);
    }

    public void insertDibs(DibsDTO dto) throws Exception{
        myPageDibsMapper.insertDibs(dto);
    }

    public void deleteDibs(int dibs_seq) throws Exception{
        myPageDibsMapper.deleteDibs(dibs_seq);
    }
}
