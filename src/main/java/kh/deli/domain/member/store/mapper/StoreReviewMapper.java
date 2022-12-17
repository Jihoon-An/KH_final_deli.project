package kh.deli.domain.member.store.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface StoreReviewMapper {

    List<Map<String,Object>> getReviewInfo(int store_seq);

}
