package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.AddressDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StoreSearchMapper {

    List<HashMap<String, Object>> selectDistanceByAccSeq(int acc_seq);

}
