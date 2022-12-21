package kh.deli.domain.owner.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface OwnerBatchMapper {

    public String executeDailySales(Map<String,Object> msg);

}
