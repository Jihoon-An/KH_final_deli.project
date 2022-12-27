package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.OwnerDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OwnerOwnerMapper {
    @Select("SELECT OWNER.* FROM OWNER,STORE WHERE OWNER.OWNER_SEQ=STORE.OWNER_SEQ and store.store_seq=${store_seq}")
    public OwnerDTO getBsInfo(int store_seq);

    @Select("SELECT OWNER_SEQ FROM OWNER WHERE ACC_SEQ = #{ownerAccSeq}")
    Integer getOwnerSeqByAcc(@Param("ownerAccSeq") int ownerAccSeq);
}
