package kh.deli.domain.member.header.controller;

import kh.deli.domain.member.header.service.DestinationService;
import kh.deli.global.entity.AddressDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/member/header/destination")
public class DestinationController {

    private final DestinationService destinationService;
    private final HttpSession session;

    @RequestMapping("")
    public String selectAll(Model model) throws Exception {
        int acc_seq = (Integer) session.getAttribute("acc_seq");
        List<AddressDTO> addressList = destinationService.selectAll(acc_seq);
        model.addAttribute("address_List", addressList);
        return "/member/header/destination";
    }

    @ResponseBody
    @RequestMapping("insert")
    public void insert(AddressDTO addressDTO) throws Exception {
        destinationService.insert(addressDTO);
    }

    @ResponseBody
    @RequestMapping("divisionChange")
    public void divisionChange(@RequestParam(value = "add_seq", required = false) List<String> addSeqList,
                               @RequestParam(value = "add_division", required = false) List<String> addDivisionList
    ) {
        for(int i = 0; i < addSeqList.size(); i++) {
            destinationService.modify(Integer.valueOf(addSeqList.get(i)), addDivisionList.get(i));
        }
    }

    @ResponseBody
    @RequestMapping("delete")
    public void delete(int add_seq) throws Exception {
        destinationService.delete(add_seq);
    }

}
