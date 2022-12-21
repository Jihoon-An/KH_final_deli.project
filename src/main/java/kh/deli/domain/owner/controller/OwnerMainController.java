package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.service.OwnerMainService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/owner/")
public class OwnerMainController {

    private final OwnerMainService ownerMainService;

    @RequestMapping("selectSales")
    public String toMenuAdd(int store_seq,String startDate, String endDate) throws Exception{

        System.out.println(store_seq+" : "+startDate+" : "+endDate);
        System.out.println("매출보기");

        String result=ownerMainService.selectSpecific(store_seq,startDate,endDate);


        return result;
    }

}
