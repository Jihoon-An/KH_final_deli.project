package kh.deli.domain.owner.mapper;

import kh.deli.global.entity.OwnerDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface OwnerInfoMapper {


    @Select("SELECT ACC_EMAIL FROM ACCOUNT WHERE ACC_SEQ = #{acc_seq}")
    String findEmailBySeq(@Param("acc_seq") int accSeq);

    @Select("SELECT * FROM OWNER WHERE ACC_SEQ = #{acc_seq}")
    OwnerDTO findOwnerInfoBySeq(@Param("acc_seq") int accSeq);

    @Select("SELECT COUNT(*) FROM ACCOUNT WHERE ACC_SEQ = #{acc_seq} AND ACC_PW = #{acc_pw}")
    int checkOldPassWord(Map<String, Object> param);

    @Update("UPDATE ACCOUNT SET ACC_PW = #{acc_pw} WHERE ACC_SEQ = #{acc_seq}")
    void modifyAccountPW(Map<String, Object> param);

    @Update("UPDATE OWNER " +
            "SET " +
            "OWNER_NAME = #{owner_name}, " +
            "OWNER_PHONE = #{owner_phone}, " +
            "OWNER_NUM = #{owner_num} " +
            "WHERE " +
            "ACC_SEQ = #{acc_seq}")
    void modifyOwnerInfo(OwnerDTO ownerDTO);

    @Update("UPDATE OWNER SET OWNER_CARD_IMG = #{owner_card_img} WHERE ACC_SEQ = #{acc_seq}")
    void modifyOwnerCardImg(@Param("owner_card_img") String ownerCardImg, @Param("acc_seq") int accSeq);

    @Select("SELECT OWNER_CARD_IMG FROM OWNER WHERE ACC_SEQ = #{acc_seq}")
    String findOwnerCardBySeq(@Param("acc_seq") int accSeq);

}
