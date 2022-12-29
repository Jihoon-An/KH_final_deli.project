package kh.deli.global.util.alarm;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AlarmAccountMapper {
    @Select("SELECT ACC_TYPE FROM ACCOUNT WHERE ACC_SEQ = #{seq, jdbcType=INTEGER}")
    String getType(@Param("seq") Integer seq);

    @Select("SELECT ACC_SEQ FROM ACCOUNT WHERE ACC_TYPE = #{type}")
    List<Integer> getSeqListByType(@Param("type") String type);
}
