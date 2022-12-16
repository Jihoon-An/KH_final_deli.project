package kh.deli.domain.main.service;

import kh.deli.domain.main.mapper.MemberMainMapper;
import kh.deli.global.entity.StoreDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    public List<Integer> carry(List<StoreDTO> list){
        List<Integer> starlist=new ArrayList<>();
                for(int i=0;i<list.size();i++){
                    int store_seq=list.get(i).getStore_seq();
                    System.out.println("t서비스 : "+ store_seq);
                    Integer value = this.selectStar(store_seq);
                    starlist.add(value);
                }
                return starlist;
    }
}
