package kh.deli.domain.admin.mapper;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminReviewMapper {

    List<AdminReviewDTO> selectAll();

    int deleteReview(@Param("rev_seq") int rev_seq);

    void modifyReviewDisplay(Map<String,Object>param);
}
