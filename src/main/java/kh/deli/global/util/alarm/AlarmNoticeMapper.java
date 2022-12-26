package kh.deli.global.util.alarm;

import kh.deli.global.entity.NoticeDTO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AlarmNoticeMapper {

    @Insert("INSERT INTO NOTICE VALUES(" +
            "#{notice.notice_seq}, " +
            "#{notice.from_acc_seq}, " +
            "#{notice.to_acc_seq}, " +
            "#{notice.notice_title}, " +
            "#{notice.notice_content}, " +
            "#{notice.notice_time})")
    void put(@Param("notice") NoticeDTO notice);

    @Select("SELECT NOTICE_SEQ.NEXTVAL FROM DUAL")
    Integer getNextSeq();

    @Delete("DELETE FROM NOTICE WHERE NOTICE_SEQ = #{seq}")
    void delete(@Param("seq") Integer seq);

    @Select("SELECT * FROM NOTICE WHERE TO_ACC_SEQ = #{toAccSeq}")
    List<NoticeDTO> findByToSeq(@Param("toAccSeq") int toAccSeq);
}
