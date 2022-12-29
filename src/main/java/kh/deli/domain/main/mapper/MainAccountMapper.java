package kh.deli.domain.main.mapper;

import kh.deli.global.entity.AccountDTO;
import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.MemberDTO;
import kh.deli.global.entity.MenuDTO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MainAccountMapper {

    @Select("SELECT ACC_EMAIL FROM ACCOUNT WHERE ACC_EMAIL = #{email}")
    String findByEmail(@Param("email") String email);

    void insertOwner(@Param("acc") AccountDTO acc);


    @Select("SELECT ACC_SEQ.NEXTVAL FROM DUAL")
    int getNextAccSeq();

    int login(Map<String, String> param);


    void memberSignUp(AccountDTO accountDTO);
    void insertMember(MemberDTO memberDTO);
    void insertAddress(AddressDTO addressDTO);




    void kakaoSignUp(AccountDTO accountDTO);

    int findByAccToken(String acc_token);

    String getAccEmail(String acc_token);

    @Select("SELECT ACC_SEQ FROM ACCOUNT WHERE ACC_EMAIL = #{acc_email}")
    int getAccSeq(String acc_email);

    //MemberMainPage
    @Select("select acc_type from account where acc_seq=#{acc_seq}")
    String selectType (int acc_seq);

    @Select("SELECT ACC_EMAIL FROM MEMBER M JOIN ACCOUNT A ON M.ACC_SEQ = A.ACC_SEQ WHERE M.MEM_PHONE = #{mem_phone}")
    List<String> findEmailByPhoneNumber(@Param("mem_phone") String phoneNumber);

    @Select("SELECT A.ACC_SEQ " +
            "FROM MEMBER M JOIN ACCOUNT A ON M.ACC_SEQ = A.ACC_SEQ " +
            "WHERE A.ACC_EMAIL = #{acc_email} and M.MEM_PHONE = #{mem_phone}")
    Integer findSeqByEmailAndPhone(Map<String, String> param);

    @Update("UPDATE ACCOUNT SET ACC_PW = #{acc_pw} WHERE ACC_SEQ = #{acc_seq}")
    void modifyPassWordWithRandomCodeBySeq(Map<String, Object> param);

    @Select("SELECT OWNER_CARD_IMG FROM OWNER WHERE ACC_SEQ = #{acc_seq}")
    String findOwnerCardBySeq(@Param("acc_seq") int accSeq);


    /**
     * <h1>[오너] 회원탈퇴 매퍼</h1>
     */
    @Select("SELECT OWNER_SEQ FROM OWNER WHERE ACC_SEQ = #{acc_seq}")
    Integer getOwnerSeqByAccSeq(@Param("acc_seq") int accSeq);
    @Select("SELECT STORE_SEQ FROM STORE WHERE OWNER_SEQ = #{owner_seq}")
    List<Integer> getStoreSeqListByOwnerSeq(@Param("owner_seq") int ownerSeq);
    @Select("SELECT REV_SYSNAME FROM REVIEW WHERE STORE_SEQ = #{store_seq} AND REV_SYSNAME IS NOT NULL")
    List<String> getReviewImgListByStoreSeq(@Param("store_seq") int storeSeq);
    @Select("SELECT MENU_IMG FROM MENU WHERE STORE_SEQ = #{store_seq} AND MENU_IMG IS NOT NULL")
    List<MenuDTO> getMenuImgListByStoreSeq(@Param("store_seq") int storeSeq);

    @Delete("DELETE FROM DIBS WHERE STORE_SEQ = #{store_seq}")
    void deleteDibsByStoreSeq(@Param("store_seq") int storeSeq);
    @Delete("DELETE FROM REVIEW WHERE STORE_SEQ = #{store_seq}")
    void deleteReviewByStoreSeq(@Param("store_seq") int storeSeq);
    @Delete("DELETE FROM MENU_OPTION WHERE MENU_SEQ = #{menu_seq}")
    void deleteMenuOptionByMenuOption(@Param("menu_seq") int menuSeq);
    @Delete("DELETE FROM MENU WHERE STORE_SEQ = #{store_seq}")
    void deleteMenuByStoreSeq(@Param("store_seq") int storeSeq);
    @Delete("DELETE FROM OWNER WHERE ACC_SEQ = #{acc_seq}")
    void deleteOwnerByAccSeq(@Param("acc_seq") int accSeq);
    @Delete("DELETE FROM ACCOUNT WHERE ACC_SEQ = #{acc_seq}")
    void deleteAccountByAccSeq(@Param("acc_seq") int accSeq);
    @Delete("DELETE FROM STORE WHERE OWNER_SEQ = #{owner_seq}")
    void deleteStoreByOwnerSeq(@Param("owner_seq") int ownerSeq);

    /**
     * <h1>[일반] 회원탈퇴 매퍼</h1>
     */
    @Select("SELECT REV_SYSNAME FROM REVIEW WHERE ACC_SEQ = #{acc_seq} AND REV_SYSNAME IS NOT NULL")
    List<String> getReviewImgListByAccSeq(@Param("acc_seq") int accSeq);
    @Delete("DELETE FROM DIBS WHERE ACC_SEQ = #{acc_seq}")
    void deleteDibsByAccSeq(@Param("acc_seq") int accSeq);
    @Delete("DELETE FROM REVIEW WHERE ACC_SEQ = #{acc_seq}")
    void deleteReviewByAccSeq(@Param("acc_seq") int accSeq);
    @Delete("DELETE FROM MEMBER_COUPON WHERE ACC_SEQ = #{acc_seq}")
    void deleteMemberCouponByAccSeq(@Param("acc_seq") int accSeq);
    @Delete("DELETE FROM ADDRESS WHERE ACC_SEQ = #{acc_seq}")
    void deleteAddressByAccSeq(@Param("acc_seq") int accSeq);
    @Delete("DELETE FROM MEMBER WHERE ACC_SEQ = #{acc_seq}")
    void deleteMemberByAccSeq(@Param("acc_seq") int accSeq);











}
