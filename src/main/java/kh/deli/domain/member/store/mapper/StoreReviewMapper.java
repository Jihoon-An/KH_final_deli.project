package kh.deli.domain.member.store.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StoreReviewMapper {

    List<Map<String,Object>> getReviewInfo(int store_seq);

}
