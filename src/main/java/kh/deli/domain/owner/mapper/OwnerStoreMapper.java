package kh.deli.domain.owner.mapper;

import kh.deli.domain.owner.dto.StoreNameAndSeqRequestDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
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

    @Select("SELECT OWNER_SEQ FROM OWNER o WHERE ACC_SEQ =${acc_seq} ")
    Integer selectOwnerByAcc(int acc_seq);

    @Select("SELECT  * FROM store WHERE OWNER_SEQ =#{owner_seq}")
    List<StoreDTO> selectAllByOwner(int owner_seq);

    @Select("SELECT * FROM STORE WHERE OWNER_SEQ = " +
            "(SELECT OWNER_SEQ FROM OWNER WHERE ACC_SEQ = #{accSeq})")
    List<StoreDTO> findByAccSeq(@Param("accSeq") int accSeq);
}
