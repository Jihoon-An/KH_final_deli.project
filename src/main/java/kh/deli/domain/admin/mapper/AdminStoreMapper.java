package kh.deli.domain.admin.mapper;

import kh.deli.domain.admin.dto.AdminStoreDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AdminStoreMapper {

    public List<AdminStoreDTO> selectAllStore();

    @Delete("DELETE FROM STORE WHERE store_seq=#{store_seq}")
    public void deleteByStoreSeq(int store_seq);

    @Update("UPDATE STORE SET STORE_DISPLAY = 'Y' WHERE STORE_SEQ = #{store_seq}")
    public void updateDisplayAsY(int store_seq);

    @Update("UPDATE STORE SET STORE_DISPLAY = 'N' WHERE STORE_SEQ = #{store_seq}")
    public void updateDisplayAsN(int store_seq);

}
