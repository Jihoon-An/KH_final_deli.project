package kh.deli.global.util.alarm;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AlarmMemberMapper {
    @Select("SELECT MEM_NICK FROM MEMBER WHERE ACC_SEQ = #{accSeq}")
    String getNick(@Param("accSeq") int accSeq);
}
