package kh.deli.domain.main.service;

import kh.deli.domain.main.mapper.MemberMainMapper;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class MemberMainService {
    private final MemberMainMapper memberMainMapper;
    public String selectType(int acc_seq){
        return memberMainMapper.selectType(acc_seq);
    }
}
