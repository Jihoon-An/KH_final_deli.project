package kh.deli.domain.admin.mapper;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    public List<AdminReviewDTO> selectAll();

    public int deleteReview(int rev_seq);
}
