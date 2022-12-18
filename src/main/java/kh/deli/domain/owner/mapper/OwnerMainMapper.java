package kh.deli.domain.owner.mapper;

import kh.deli.domain.owner.dto.OwnerStoreInfoDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OwnerMainMapper {

    public List<OwnerStoreInfoDTO> selectByOwner (int owner_seq);

}
