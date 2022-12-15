package kh.deli.domain.member.header.service;

import kh.deli.domain.admin.dto.AdminReviewDTO;
import kh.deli.domain.admin.mapper.AdminReviewMapper;
import kh.deli.domain.member.header.mapper.DestinationMapper;
import kh.deli.global.entity.AddressDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class DestinationService {

    private final DestinationMapper destinationMapper;

    public List<AddressDTO> selectAll(int acc_seq) throws Exception {
        return destinationMapper.selectAll(acc_seq);
    }

    public void insert(AddressDTO addressDTO) throws Exception {
        destinationMapper.insert(addressDTO);
    }

}
