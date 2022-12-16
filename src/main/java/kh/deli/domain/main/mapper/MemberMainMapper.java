package kh.deli.domain.main.mapper;

import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MemberMainMapper {

    public Integer selectStar (int store_seq);

    public String selectType (int acc_seq);

    public List<StoreDTO> selectAll();
}
