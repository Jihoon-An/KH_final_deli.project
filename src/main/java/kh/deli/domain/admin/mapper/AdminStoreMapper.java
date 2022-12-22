package kh.deli.domain.admin.mapper;

import kh.deli.domain.admin.dto.AdminStoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AdminStoreMapper {

    public List<AdminStoreDTO> selectAllStore();
    public AdminStoreDTO selectByStore_seq(int store_seq);
}
