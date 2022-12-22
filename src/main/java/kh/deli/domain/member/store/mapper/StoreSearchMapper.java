package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.MenuDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StoreSearchMapper {

    List<Map<String, Object>> selectDistanceByAccSeq(@Param("acc_seq") int acc_seq, @Param("search") String search, @Param("filter") String filter);

    List<MenuDTO>selectMenuListByStoreSeq(int store_seq);

}
