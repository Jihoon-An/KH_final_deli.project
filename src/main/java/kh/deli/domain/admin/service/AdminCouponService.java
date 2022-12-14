package kh.deli.domain.admin.service;

import kh.deli.domain.admin.mapper.AdminCouponMapper;
import kh.deli.global.entity.CouponDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AdminCouponService {
    private final AdminCouponMapper couponMngMapper;

    public void put(CouponDTO coupon) {
        couponMngMapper.put(coupon);
    }

    public boolean dupleCheck(String code) {
        int result = couponMngMapper.getCpCodeByCpCode(code);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }
}
