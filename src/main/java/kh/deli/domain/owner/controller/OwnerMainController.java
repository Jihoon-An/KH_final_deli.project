package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.dto.OwnerDdSalesDTO;
import kh.deli.domain.owner.service.OwnerMainService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/owner/")
public class OwnerMainController {

    private final OwnerMainService ownerMainService;

    @RequestMapping("selectSales")
    public List<OwnerDdSalesDTO> toMenuAdd(int store_seq, String startDate, String endDate) throws Exception{

        List<OwnerDdSalesDTO> list=ownerMainService.selectSpecific(store_seq,startDate,endDate);

        return list;
    }

}
