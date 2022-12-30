package kh.deli.domain.owner.mapper;

import kh.deli.domain.owner.dto.StoreNameAndSeqRequestDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OwnerStoreMapper {

    public void insertStore(StoreDTO dto);

    @Select(" SELECT STORE_ORIGIN FROM STORE,MENU WHERE MENU.STORE_SEQ=STORE.STORE_SEQ")
    public List<StoreDTO> menuOrigin();

    //식당 수정
    void modifyStore(StoreDTO storeDTO);

    @Select("SELECT STORE_NAME, STORE_SEQ FROM STORE WHERE OWNER_SEQ = #{ownerSeq}")
    List<StoreNameAndSeqRequestDTO> getSeqAndNameListByOwnerAccSeq(@Param("ownerSeq") int ownerSeq);

    @Select("SELECT OWNER_SEQ FROM STORE WHERE STORE_SEQ = #{storeSeq}")
    Integer getOwnerByStore(@Param("storeSeq") int storeSeq);

    @Select("SELECT * FROM STORE WHERE OWNER_SEQ = " +
            "(SELECT OWNER_SEQ FROM OWNER WHERE ACC_SEQ = #{accSeq})")
    List<StoreDTO> findByAccSeq(@Param("accSeq") int accSeq);

    @Update("UPDATE STORE SET STORE_OPEN = #{newVal} WHERE STORE_SEQ = #{storeSeq}")
    void toggleDisplay(@Param("storeSeq") int storeSeq, @Param("newVal") String newVal);

    @Select("select owner_Seq from owner where acc_seq = #{acc_seq} ")
    int selectOwnerSeq(int acc_seq);
}
