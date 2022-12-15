package kh.deli.domain.member.header.mapper;

import kh.deli.global.entity.AddressDTO;
import kh.deli.global.entity.CouponDTO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface DestinationMapper {

    @Select("SELECT * FROM address WHERE acc_seq = #{value} order by 3 DESC")
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

    @Update("UPDATE address set " +
            "add_division = #{add_division} " +
            "WHERE add_seq = #{add_seq}")
    void modify(int add_seq, String add_division);

    @Delete("delete FROM address WHERE add_seq = #{value}")
    void delete(int add_seq);


}
