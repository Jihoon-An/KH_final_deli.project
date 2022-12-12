package kh.deli.domain.main.service;

import kh.deli.domain.main.dto.MemberMainRequestDTO;
import kh.deli.domain.main.mapper.MemberMainMapper;
import kh.deli.global.entity.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberMainService {

    @Autowired
    private MemberMainMapper memberMainMapper;

    public List<MemberMainRequestDTO> selectByStar(){
        return memberMainMapper.selectByStar();
    }
}
