package kh.deli.domain.owner.mapper;

import kh.deli.domain.owner.dto.OwnerDailySalesDTO;
import kh.deli.domain.owner.dto.OwnerDdSalesDTO;
import kh.deli.domain.owner.dto.OwnerStoreInfoDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
@Mapper
public interface OwnerMainMapper {

    public List<OwnerStoreInfoDTO> selectByOwner (@Param("owner_seq") int owner_seq);

    public OwnerDailySalesDTO selectSales(@Param("store_seq") int store_seq, @Param("now") LocalDate now);

    public int selectOwnerSeq(@Param("acc_seq") int acc_seq);

    public List<OwnerDdSalesDTO> selectSpecific(
            @Param("store_seq") int store_seq,
            @Param("startDate") String startDate,
            @Param("endDate") String endDate
    );

}
