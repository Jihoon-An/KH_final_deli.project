package kh.deli.domain.member.myPage.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.myPage.service.MyPageReviewService;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import kh.deli.global.entity.StoreDTO;
import kh.deli.global.util.FileUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/myPage/review")
@AllArgsConstructor
public class MypageReviewModifyController {

    private final MyPageReviewService reviewService;
    private final HttpSession session;
    private final Gson gson;

    @RequestMapping()
    public String toModifyReviewForm(Model model) throws Exception {
        int order_seq = 18;
        int rev_seq = 181;
        int store_seq = 19;
        OrdersDTO orders_dto = reviewService.selectByOrderSeq(order_seq);
        ReviewDTO review_dto = reviewService.selectByReviewSeq(rev_seq);
//        List<FormedReviewDTO>formedReviewDTOList=review_dto.getRev_sysname();
//        JsonArray jsonArray = new JsonArray(review_dto.getRev_sysname());

        List<String>frmImgList=new ArrayList<>();
        Type type = new TypeToken<List<String>>(){}.getType();
        List<String> frmImg = gson.fromJson(review_dto.getRev_sysname(),type);
        System.out.println(frmImg);

        StoreDTO store_dto = reviewService.selectByStoreSeq(store_seq);
        model.addAttribute("orders_dto", orders_dto);
        model.addAttribute("review_dto", review_dto);
        model.addAttribute("store_dto", store_dto);
        model.addAttribute("frmImg",frmImg);

        return "/member/myPage/modifyReview";
    }

    @RequestMapping("modify")
    public String modifyReview(ReviewDTO dto, String del_files_json, MultipartFile[] files) throws Exception {
        FileUtil fileUtil = new FileUtil();
        Type stringInListType = new TypeToken<List<String>>() {
        }.getType();
        List<String> newFileList = new ArrayList<>();
        //기존파일 리스트 불러오기
        ReviewDTO orgReview = reviewService.selectByReviewSeq(dto.getRev_seq());
        newFileList.addAll(gson.fromJson(orgReview.getRev_sysname(), stringInListType));

        //기존파일 지우기
        List<String> del_files = gson.fromJson(del_files_json, stringInListType);

            for (String del_file : del_files) {
                fileUtil.delete(session, "/resources/img/review", del_file);
                newFileList.remove(del_file);
            }

            //새로운 파일 리스트 만들기
            List<String> addFileNames = fileUtil.saves(session, "/resources/img/review", files);
            newFileList.addAll(addFileNames);

            dto.setRev_sysname(gson.toJson(newFileList));
            dto.setRev_seq(181); //임시리뷰번호
            reviewService.modifyReview(dto);
        return "redirect:/myPage/review";
    }

}
