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
    public void divisionChange(@RequestParam(value = "add_seq", required = true) List<String> add_seq,
                               @RequestParam(value = "add_division", required = true) List<String> add_division
    ) throws Exception {
        System.out.println("add_seq: " + add_seq);
        System.out.println("add_division: " + add_division);

        System.out.println("-----------------------------------------------");

//        System.out.println("add_seq[0]: " + add_seq.get(0));
//        System.out.println("add_division[0]: " + add_division.get(0));
//
//        System.out.println("add_seq[1]: " + add_seq.get(1));
//        System.out.println("add_division[1]: " + add_division.get(1));
//
//        System.out.println("-----------------------------------------------");
//
//        System.out.println("add_seq[3]: " + add_seq.get(3));
//        System.out.println("add_division[3]: " + add_division.get(3));
    }

}
