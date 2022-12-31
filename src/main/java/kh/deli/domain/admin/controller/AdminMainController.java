package kh.deli.domain.admin.controller;

import kh.deli.domain.admin.dto.AdminMainDTO;
import kh.deli.domain.admin.service.AdminMainService;
import kh.deli.domain.owner.dto.OwnerDailySalesDTO;
import kh.deli.domain.owner.dto.OwnerStoreInfoDTO;
import kh.deli.domain.owner.service.OwnerMainService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("admin")
@AllArgsConstructor
public class AdminMainController {

    private final AdminMainService adminMainService;

    //어드민 메인 페이지로 이동
    @RequestMapping("")
    public String toAdminMain(Model model) throws Exception {

        // 일자별 매출 : 매출 값 출력
        List<AdminMainDTO> selectAllSalesList = adminMainService.selectAllList();

        model.addAttribute("salesList",selectAllSalesList);
        return "admin/adminMain";
    }

}
