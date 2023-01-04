package kh.deli.domain.admin.service;

import kh.deli.domain.admin.mapper.AdminCouponMapper;
import kh.deli.global.entity.CouponDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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

    public String isEmailExist(String user_email, Integer cp_seq,Integer cp_period) {
        Integer accSeq = cpMapper.selectByEmail(user_email);

        cp_period = Optional.ofNullable(cp_period).orElse(100);
        if (accSeq!= null) {
            cpMapper.insertCoupon(cp_seq, accSeq,cp_period);
            String nickName=cpMapper.selectNickNameBySeq(accSeq);
            String result=nickName+"님에게 쿠폰 발급이 완료되었습니다.";
            return result;
        } else {
            return "쿠폰 발급 실패";
        }
    }
}
