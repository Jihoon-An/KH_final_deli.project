package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.OwnerDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OwnerOwnerMapper {
    public OwnerDTO bsInfo(int acc_seq);
}
