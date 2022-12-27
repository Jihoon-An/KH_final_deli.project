package kh.deli.domain.owner.service;

import kh.deli.domain.owner.mapper.OwnerOwnerMapper;
import kh.deli.global.entity.OwnerDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class OwnerOwnerService {
    private final OwnerOwnerMapper ownerOwnerMapper;
    public OwnerDTO getBsInfo(int store_seq) throws Exception{
        return ownerOwnerMapper.getBsInfo(store_seq);
    }

    public int convertAccSeqToOwnerSeq(int ownerAccSeq) {
        Optional<Integer> ownerSeq = Optional.ofNullable(ownerOwnerMapper.getOwnerSeqByAcc(ownerAccSeq));
        return ownerSeq.orElse(19); //sample data
    }
}
