package kh.deli.domain.member.store.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StoreSearchMapper {

    List<Map<String, Object>> selectDistanceByAccSeq(int acc_seq);

}
