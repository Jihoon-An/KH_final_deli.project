package kh.deli.domain.admin.service;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import kh.deli.domain.admin.mapper.AdminReviewMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class AdminReviewService {
    private final AdminReviewMapper adminReviewMapper;

    public List<AdminReviewDTO> selectAll() throws Exception {
        return adminReviewMapper.selectAll();
    }
    public int deleteReview(int rev_seq) throws Exception{
        return adminReviewMapper.deleteReview(rev_seq);
    }

}
