package kh.deli.domain.member.myPage.service;

import com.google.gson.Gson;
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
public class MemberReviewService {

    private final MyPageReviewMapper memberReviewFormMapper;

    private final Gson gson;

    public void reviewInsert(HttpSession session, ReviewDTO dto, MultipartFile[] files) throws Exception {
        FileUtil fileUtil = new FileUtil();

        List<String> sysNameList = fileUtil.saves(session, "/resources/img/review", files);

        dto.setRev_sysname(gson.toJson(sysNameList));

        memberReviewFormMapper.reviewInsert(dto);
    }

    public OrdersDTO selectByOrderSeq(int order_seq) throws Exception {
        return memberReviewFormMapper.selectByOrderSeq(order_seq);
    }

    public ReviewDTO selectByReviewSeq(int rev_seq) throws Exception {
        return memberReviewFormMapper.selectByReviewSeq(rev_seq);
    }

    public StoreDTO selectByStoreSeq(int store_seq) throws Exception {
        return memberReviewFormMapper.selectByStoreSeq(store_seq);
    }

}
