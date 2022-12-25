package kh.deli.global.util.alarm;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AlarmOwnerMapper {
    @Select("SELECT OWNER_NAME FROM OWNER WHERE ACC_SEQ = #{accSeq}")
    String getName(@Param("accSeq") int accSeq);
}
