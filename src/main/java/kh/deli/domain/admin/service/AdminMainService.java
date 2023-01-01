package kh.deli.domain.admin.service;

import kh.deli.domain.admin.dto.AdminMainDTO;
import kh.deli.domain.admin.mapper.AdminMainMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class AdminMainService {
    private final AdminMainMapper adminMainMapper; //초기화한 값을 끝까지 유지하기 위해 privat final사용

    public List<AdminMainDTO> selectAllSalesList(){
        return adminMainMapper.selectAllSalesList();
    }

    public AdminMainDTO selectTodaySales(){
        return adminMainMapper.selectTodaySales();
    }

}
