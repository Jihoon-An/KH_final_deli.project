package kh.deli.domain.admin.service;

import kh.deli.domain.admin.mapper.CouponMngMapper;
import kh.deli.global.entity.CouponDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AddCouponService {
    private final CouponMngMapper couponMngMapper;

    public void put(CouponDTO coupon) {
        couponMngMapper.put(coupon);
    }

    public boolean dupleCheck(String code) {
        String result = couponMngMapper.getCpCodeByCpCode(code);
        if (result != null) {
            return true;
        } else {
            return false;
        }
    }
}
