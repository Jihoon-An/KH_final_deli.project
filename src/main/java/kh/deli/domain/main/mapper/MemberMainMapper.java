package kh.deli.domain.main.mapper;

import kh.deli.domain.main.dto.MemberMainRequestDTO;
import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MemberMainMapper {

    public List<MemberMainRequestDTO> selectStar ();
    public String selectType (int acc_seq);

    public List<StoreDTO> selectAll();
}
