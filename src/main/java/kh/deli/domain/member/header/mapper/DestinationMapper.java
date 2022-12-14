package kh.deli.domain.member.header.mapper;

import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.CouponDTO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface DestinationMapper {

    @Select("SELECT * FROM address WHERE acc_seq = #{value}")
    List<AddressDTO> selectAll(int acc_seq);

    @Insert("INSERT INTO address VALUES (" +
            "add_seq.NEXTVAL," +
            "#{acc_seq}," +
            "'add'," +
            "#{add_name}," +
            "#{add_detail1}," +
            "#{add_detail2}," +
            "#{add_x}," +
            "#{add_y}," +
            "null)")
    void insert(AddressDTO addressDTO);

}
