package kh.deli.domain.member.myPage.controller;

import kh.deli.domain.member.myPage.service.MemberReviewService;
import kh.deli.global.entity.OrdersDTO;
import kh.deli.global.entity.ReviewDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/memberReviewForm/")
@AllArgsConstructor
public class MyPageReviewViewController {

        private final MemberReviewService memberReviewFormService;
        private final HttpSession session;

        @RequestMapping()
        public String toMemberMain(Model model) throws Exception {
            int order_seq = 1; // 내 주문리스트에서 order_seq 파라미터로 가져오기
            OrdersDTO dto = memberReviewFormService.selectByOrderSeq(order_seq);

            System.out.println(dto.getMenu_list());

            model.addAttribute("dto", dto);

            return "/member/myPage/memberReview";

        }

        @PostMapping("reviewInsert")
        public String reviewInsert(ReviewDTO dto, MultipartFile[] files) throws Exception {

            memberReviewFormService.reviewInsert(session, dto, files);

            return "redirect:/";
        }
    }