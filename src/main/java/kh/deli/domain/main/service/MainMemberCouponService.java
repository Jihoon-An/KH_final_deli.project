package kh.deli.domain.main.service;

import kh.deli.domain.main.mapper.MainMemberCouponMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class MainMemberCouponService {
    private final MainMemberCouponMapper mcpMapper;

    public void giveSignUpCp(int accSeq) {
        mcpMapper.giveSignUpCp(accSeq);
    }
}
