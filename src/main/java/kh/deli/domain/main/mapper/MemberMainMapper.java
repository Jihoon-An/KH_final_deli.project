package kh.deli.domain.main.mapper;

import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MemberMainMapper {

    @Select("select acc_type from account where acc_seq=#{acc_seq}")
    String selectType (int acc_seq);

}
