package kh.deli.domain.member.myPage.service;

import com.google.gson.Gson;
import kh.deli.domain.member.myPage.dto.MypageReviewDTO;
import kh.deli.domain.member.myPage.mapper.MyPageReviewMapper;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import kh.deli.global.util.FileUtil;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class MyPageReviewService {

    private final MyPageReviewMapper myPageReviewMapper;

    private final Gson gson;

    public void reviewInsert(HttpSession session, ReviewDTO dto, MultipartFile[] files) throws Exception {
        FileUtil fileUtil = new FileUtil();

        if (dto.getRev_sysname().equals("1")) {
            List<String> sysNameList = fileUtil.saves(session, "/resources/img/review", files);
            dto.setRev_sysname(gson.toJson(sysNameList));

        } else {
            dto.setRev_sysname("");
        }

        int acc_seq = (Integer) session.getAttribute("acc_seq");
        dto.setAcc_seq(acc_seq);

        myPageReviewMapper.reviewInsert(dto);
    }

    public OrdersDTO selectByOrderSeq(int order_seq) throws Exception {
        return myPageReviewMapper.selectByOrderSeq(order_seq);
    }

    public ReviewDTO selectByReviewSeq(int rev_seq) throws Exception {
        return myPageReviewMapper.selectByReviewSeq(rev_seq);
    }


    public StoreDTO selectByStoreSeq(int store_seq) throws Exception {
        return myPageReviewMapper.selectByStoreSeq(store_seq);
    }

    public void modifyReview(ReviewDTO dto) throws Exception {
        Map<String, Object> param = new HashMap<>();
        param.put("rev_star", dto.getRev_star());
        param.put("rev_content", dto.getRev_content());
        param.put("rev_seq", dto.getRev_seq());
        param.put("rev_sysname", dto.getRev_sysname());
        myPageReviewMapper.modifyReview(param);

    }


    public List<Map<String, Object>> getReviews(MypageReviewDTO param){
        return myPageReviewMapper.getReviews(param);
    }
    public int getReviewCount(MypageReviewDTO param) throws Exception{
        return MyPageReviewMapper.getReviewCount(param);
    }
}
