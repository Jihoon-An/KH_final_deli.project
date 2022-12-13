package kh.deli.domain.admin.service;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import kh.deli.domain.admin.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public List<AdminReviewDTO> selectAll() throws Exception {
        return adminMapper.selectAll();
    }

}
