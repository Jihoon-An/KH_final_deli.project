package kh.deli.domain.owner.mapper;

import kh.deli.domain.owner.dto.OwnerDailySalesDTO;
import kh.deli.domain.owner.dto.OwnerDdSalesDTO;
import kh.deli.domain.owner.dto.OwnerStoreInfoDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
@Mapper
public interface OwnerMainMapper {

    public List<OwnerStoreInfoDTO> selectByOwner (int owner_seq);

    public OwnerDailySalesDTO selectSales(int store_seq, LocalDate now);

    public int selectOwnerSeq(int acc_seq);

    public List<OwnerDdSalesDTO> selectSpecific(int store_seq, String startDate, String endDate);

}
