package kh.deli.domain.main.service;

import kh.deli.domain.main.mapper.MemberMainMapper;
import kh.deli.global.entity.StoreDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberMainService {

    @Autowired
    private MemberMainMapper memberMainMapper;

    public Integer selectStar(int store_seq){
        return memberMainMapper.selectStar(store_seq);
    }

    public String selectType(int acc_seq){
        return memberMainMapper.selectType(acc_seq);
    }

    public List<StoreDTO> selectAll(){return memberMainMapper.selectAll();}
}
