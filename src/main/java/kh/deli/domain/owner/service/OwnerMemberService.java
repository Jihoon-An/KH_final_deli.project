package kh.deli.domain.owner.service;

import kh.deli.domain.owner.mapper.OwnerMemberMapper;
import kh.deli.global.entity.MemberDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class OwnerMemberService {
    private final OwnerMemberMapper memberMapper;

    /**
     * 1. storeSeq로 orders table에서 join으로 accSeq를 얻는다.
     * 2. 1에서 얻은 accSeq로 member를 조회한다.
     * 3. 정렬 순서는 ORDER BY ORDER_DATE DESC 즉, order를 넣은 최신순이다.
     * @param storeSeq
     * @return
     */
    public List<MemberDTO> getSeqNamePhoneListByStoreSeq(int storeSeq) {
        Optional<List<MemberDTO>> member = Optional.ofNullable(memberMapper.getListByStoreSeqWithOrder(storeSeq));
        return member.orElse(new ArrayList<>());
    }
}
