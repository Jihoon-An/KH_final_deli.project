package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.dto.OwnerOrderMngResponseDTO;
import kh.deli.domain.owner.dto.StoreNameAndSeqRequestDTO;
import kh.deli.domain.owner.service.OwnerOrderMngService;
import kh.deli.domain.owner.service.OwnerOrdersService;
import kh.deli.domain.owner.service.OwnerOwnerService;
import kh.deli.domain.owner.service.OwnerStoreService;
import kh.deli.global.exception.PermissionException;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Optional;

//optional로 떡칠해보기

/**
 * <h2>개발단계 DB수정시 기본값 점검요함</h2>
 */
@Controller
@AllArgsConstructor
@RequestMapping("/owner/order")
public class OrderMngController {
    private final OwnerOrdersService ordersService;
    private final OwnerStoreService storeService;
    private final OwnerOrderMngService mngService;
    private final OwnerOwnerService ownerService;

    private final HttpSession session;

    @RequestMapping("")
    public String toPage() {
        int ownerAccSeq = Optional.ofNullable(
                (Integer) session.getAttribute("acc_seq")
        ).orElse(0);
        int ownerSeq = ownerService.convertAccSeqToOwnerSeq(ownerAccSeq); //(sample data)

        List<StoreNameAndSeqRequestDTO> storeList = storeService.getStoreListByOwnerSeq(ownerSeq);

        if (storeList.size() == 0) {
            return "redirect:/owner/store/add";
        }

        Integer firstStoreSeq = storeList.get(0).getStore_seq();

        return "redirect:/owner/order/" + firstStoreSeq;
    }

    @RequestMapping("/{storeSeq}")
    public String toMngPage(Model model, @PathVariable(value = "storeSeq") Integer storeSeq) {

        int ownerAccSeq = (Integer) session.getAttribute("acc_seq");
        int ownerSeq = ownerService.convertAccSeqToOwnerSeq(ownerAccSeq); //(sample data)

        //storeList 만들기
        //사업자별 가게주문관리 전환 출력을 위한 List
        List<StoreNameAndSeqRequestDTO> storeList = storeService.getStoreListByOwnerSeq(ownerSeq);

        //session 으로 유효성 검사.
        int ownerSeqBySession = ownerService.convertAccSeqToOwnerSeq(ownerAccSeq);
        int ownerSeqByInputStore = storeService.getOwnerByStore(storeSeq);

        if (ownerSeqByInputStore != ownerSeqBySession) {
            throw new PermissionException();
        }

        //orderList 만들기
        List<OwnerOrderMngResponseDTO> orderList = mngService.getOrderMngResponseDTO(storeSeq);

        model.addAttribute("storeList", storeList);
        model.addAttribute("orderList", orderList);

        return "owner/orderMng";
    }

    @PostMapping("updateStatus")
    @ResponseBody
    public void updateStatus(@RequestBody Map<String, String> statusInfo) {
        ordersService.updateStatus(statusInfo);
    }
}
