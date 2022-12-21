package kh.deli.domain.member.myPage.service;

import com.google.gson.Gson;
import kh.deli.domain.member.myPage.dto.MypageReviewDTO;
import kh.deli.domain.member.myPage.mapper.MyPageReviewMapper;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import kh.deli.global.util.FileUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@AllArgsConstructor
public class MyPageReviewService {

    private final MyPageReviewMapper myPageReviewService;

    private final Gson gson;

    public void reviewInsert(HttpSession session, ReviewDTO dto, MultipartFile[] files) throws Exception {
        FileUtil fileUtil = new FileUtil();

        if(dto.getRev_sysname().equals("1")) {
            List<String> sysNameList = fileUtil.saves(session, "/resources/img/review", files);
            dto.setRev_sysname(gson.toJson(sysNameList));

        }else {
            dto.setRev_sysname("");
        }

        int acc_seq = (Integer) session.getAttribute("acc_seq");
        dto.setAcc_seq(acc_seq);

        myPageReviewService.reviewInsert(dto);
    }

    public OrdersDTO selectByOrderSeq(int order_seq) throws Exception {
        return myPageReviewService.selectByOrderSeq(order_seq);
    }

    public ReviewDTO selectByReviewSeq(int rev_seq) throws Exception {
        return myPageReviewService.selectByReviewSeq(rev_seq);
    }


    public StoreDTO selectByStoreSeq(int store_seq) throws Exception {
        return myPageReviewService.selectByStoreSeq(store_seq);
    }

    public List<MypageReviewDTO> getReviews() {
        return MyPageReviewMapper.getReviews();
    }
}
