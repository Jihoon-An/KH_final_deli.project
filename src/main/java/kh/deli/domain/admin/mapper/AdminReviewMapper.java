package kh.deli.domain.admin.mapper;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminReviewMapper {

    List<AdminReviewDTO> selectReviews();

    @Delete("DELETE FROM REVIEW WHERE REV_SEQ=#{rev_seq}")
    void deleteReview(int rev_seq);

    @Update("UPDATE REVIEW SET REV_DISPLAY=#{rev_display} WHERE REV_SEQ=#{rev_seq}")
    void modifyReviewDisplay(Map<String,Object>param);
}
