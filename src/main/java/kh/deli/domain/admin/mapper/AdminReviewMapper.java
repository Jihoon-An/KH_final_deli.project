package kh.deli.domain.admin.mapper;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminReviewMapper {

    List<AdminReviewDTO> selectAll();

    int deleteReview(@Param("rev_seq") int rev_seq);
}
