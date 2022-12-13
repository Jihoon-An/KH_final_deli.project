package kh.deli.domain.member.store.mapper;

import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
@Mapper
public interface StoreMapper {


    public void insertStore(StoreDTO dto);
}
