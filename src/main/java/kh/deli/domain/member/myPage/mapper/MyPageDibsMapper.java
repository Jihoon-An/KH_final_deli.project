package kh.deli.domain.member.myPage.mapper;

import kh.deli.domain.member.myPage.dto.MyPageDibsDTO;
import kh.deli.global.entity.DibsDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MyPageDibsMapper {

    public List<MyPageDibsDTO> select(int acc_seq);

    public Integer selectStar(int store_seq);

    public void insertDibs(DibsDTO dto);

    public void deleteDibs(int dibs_seq);
}
