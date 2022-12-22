package kh.deli.domain.owner.service;

import kh.deli.domain.owner.dto.OwnerDailySalesDTO;
import kh.deli.domain.owner.dto.OwnerDdSalesDTO;
import kh.deli.domain.owner.dto.OwnerStoreInfoDTO;
import kh.deli.domain.owner.mapper.OwnerMainMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.transform.Source;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class OwnerMainService {


    private final OwnerMainMapper ownerMainMapper;

    public List<OwnerStoreInfoDTO> selectByOwner(int owner_seq) throws Exception {

    return ownerMainMapper.selectByOwner(owner_seq);
    }

    public List<OwnerDailySalesDTO> selectSales(List<OwnerStoreInfoDTO> list) throws Exception{

        List<OwnerDailySalesDTO> dslist=new ArrayList<>();

        for(int i=0;i<list.size();i++){
            int store_seq=list.get(i).getStore_seq();
            LocalDate now = LocalDate.now();
            OwnerDailySalesDTO dto= ownerMainMapper.selectSales(store_seq,now);
            dslist.add(dto);
        }

        return dslist ;
    }

    public int calcul(List<OwnerDailySalesDTO> dslist) throws Exception{

        int result=0;

        for(int i=0;i<dslist.size();i++){

            if(dslist.get(i)!=null){
                int sum= dslist.get(i).getDaily_sales();
                result=result+sum;

            }else{
                int sum=0;
                result=result+sum;
            }
        }
        return result;
    }

    public int selectOwnerSeq(int acc_seq) throws Exception{
        return ownerMainMapper.selectOwnerSeq(acc_seq);
    }

    public List<OwnerDdSalesDTO> selectSpecific(int store_seq, String startDate, String endDate) throws Exception{
        List<OwnerDdSalesDTO> list = ownerMainMapper.selectSpecific(store_seq,startDate,endDate);
        return list;
    }
}
