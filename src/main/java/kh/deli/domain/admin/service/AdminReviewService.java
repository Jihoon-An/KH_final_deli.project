package kh.deli.domain.admin.service;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import kh.deli.domain.admin.mapper.AdminReviewMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class AdminReviewService {
    private final AdminReviewMapper adminReviewMapper;

    public List<AdminReviewDTO> selectReviews() throws Exception {
        return adminReviewMapper.selectReviews();
    }
    public void deleteReview(int rev_seq) throws Exception{
        adminReviewMapper.deleteReview(rev_seq);
    }

   public void modifyReviewDisplay(int rev_seq,String rev_display) throws Exception{
       Map<String,Object>param=new HashMap<>();
       param.put("rev_seq",rev_seq);
       param.put("rev_display",rev_display);
       adminReviewMapper.modifyReviewDisplay(param);
    }

}
