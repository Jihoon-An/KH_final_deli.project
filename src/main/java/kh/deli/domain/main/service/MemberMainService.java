package kh.deli.domain.main.service;

import kh.deli.domain.main.dto.MemberMainRequestDTO;
import kh.deli.domain.main.mapper.MemberMainMapper;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberMainService {

    @Autowired
    private MemberMainMapper memberMainMapper;

    public List<MemberMainRequestDTO> selectStar(){
        return memberMainMapper.selectStar();
    }

    public String selectType(int acc_seq){
        return memberMainMapper.selectType(acc_seq);
    }

    public List<StoreDTO> selectAll(){return memberMainMapper.selectAll();}
}
