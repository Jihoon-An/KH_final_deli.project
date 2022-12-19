package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.MenuDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StoreSearchMapper {

    List<Map<String, Object>> selectDistanceByAccSeq(int acc_seq, String search);

    List<MenuDTO>selectMenuListByStoreSeq(int store_seq);

}
