package kh.deli.domain.owner.service;

import kh.deli.domain.owner.mapper.OwnerBatchMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@AllArgsConstructor
public class OwnerBatchService {

    private final OwnerBatchMapper ownerBatchMapper;

    public String executeDailySales(){

        String result= "";
        Map<String,Object> param = new HashMap<>();
        param.put("msg","0");
                ownerBatchMapper.executeDailySales(param);
        result=param.get("msg").toString();
        return result;
    }

}
