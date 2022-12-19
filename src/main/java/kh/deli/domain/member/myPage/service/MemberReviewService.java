package kh.deli.domain.member.myPage.service;

import com.google.gson.Gson;
import kh.deli.domain.member.store.dto.StoreReviewDTO;
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

    private final MyPageReviewMapper MyPageReviewMapper;

    private final Gson gson;

    public void reviewInsert(HttpSession session, ReviewDTO dto, MultipartFile[] files) throws Exception {
        FileUtil fileUtil = new FileUtil();
        System.out.println("사진 주소정하기 전 : "+ files);
        if(files!=null) {
            List<String> sysNameList = fileUtil.saves(session, "/resources/img/review", files);

            dto.setRev_sysname(gson.toJson(sysNameList));

            System.out.println("주소 만듦 ");
        }else {
            System.out.println("사진없음");
            dto.setRev_sysname(null);
        }
        System.out.println("인서트 되기 전 "+dto.getRev_sysname());
        MyPageReviewMapper.reviewInsert(dto);
    }

    public OrdersDTO selectByOrderSeq(int order_seq) throws Exception {
        return MyPageReviewMapper.selectByOrderSeq(order_seq);
    }

    public ReviewDTO selectByReviewSeq(int rev_seq) throws Exception {
        return MyPageReviewMapper.selectByReviewSeq(rev_seq);
    }

    public int getReviewCount(int store_seq)throws Exception{
        return MyPageReviewMapper.getReviewCount(store_seq);
    }

    public StoreDTO selectByStoreSeq(int store_seq) throws Exception {
        return MyPageReviewMapper.selectByStoreSeq(store_seq);
    }

    //별점
    public double getReviewAvg(int store_seq) throws Exception{
        return MyPageReviewMapper.getReviewAvg(store_seq);
    }

    //리뷰출력
    public List<StoreReviewDTO> getReviews() throws Exception{
        return MyPageReviewMapper.getReviews();
    }

}
