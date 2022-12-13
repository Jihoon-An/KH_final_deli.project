package kh.deli.domain.member.userMenu.mapper;

import kh.deli.global.entity.ReviewDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberReviewFormMapper {

    public void reviewInsert(ReviewDTO dto);
}
