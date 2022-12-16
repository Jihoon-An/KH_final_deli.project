package kh.deli.domain.admin.service;

import kh.deli.domain.admin.mapper.AdminCouponMapper;
import kh.deli.global.entity.CouponDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class AdminCouponService {
    private final AdminCouponMapper cpMapper;

    public void put(CouponDTO coupon) {
        cpMapper.put(coupon);
    }

    public boolean dupleCheck(String code) {
        int result = cpMapper.getCpCodeByCpCode(code);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<CouponDTO> getAll() {
        return cpMapper.getAll();
    }

    public void deleteBySeq(int seq) {
        cpMapper.deleteBySeq(seq);
    }
}
