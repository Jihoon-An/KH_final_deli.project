package kh.deli.domain.admin.service;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import kh.deli.domain.admin.mapper.AdminReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminReviewService {

    @Autowired
    private AdminReviewMapper adminMapper;

    public List<AdminReviewDTO> selectAll() throws Exception {
        return adminMapper.selectAll();
    }
    public int deleteReview(int rev_seq) throws Exception{
        return adminMapper.deleteReview(rev_seq);
    }

}
