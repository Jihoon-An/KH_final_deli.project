package kh.deli.domain.owner.service;

import kh.deli.domain.owner.dto.StoreNameAndSeqRequestDTO;
import kh.deli.domain.owner.mapper.OwnerStoreMapper;
import kh.deli.global.entity.StoreDTO;
import kh.deli.global.util.FileUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class OwnerStoreService {

    private final OwnerStoreMapper ownerStoreMapper;
    private final HttpSession session;

    public void insertStore(StoreDTO dto) {
        ownerStoreMapper.insertStore(dto);
    }

    //식당 수정
    public void modifyStore(StoreDTO storeDTO, MultipartFile newFile) throws Exception {

        FileUtil fileUtil = new FileUtil();
        String path = "/resources/img/store";

        if (newFile.getSize() != 0) {//파일 사이즈가0이 아니라면
            String sysName = fileUtil.save(session, path, newFile);

            fileUtil.delete(session, path, storeDTO.getStore_logo());

            //겹치지 않게 이름을 만들어야함
            storeDTO.setStore_logo(sysName);
        }

        ownerStoreMapper.modifyStore(storeDTO);
    }

    public List<StoreNameAndSeqRequestDTO> getStoreListByOwnerSeq(int ownerSeq) {
        Optional<List<StoreNameAndSeqRequestDTO>> storeList
                = Optional.ofNullable(ownerStoreMapper.getSeqAndNameListByOwnerAccSeq(ownerSeq));
        return storeList.orElse(new ArrayList<>());
    }

    public int getOwnerByStore(int storeSeq) {
        Optional<Integer> ownerSeq
                = Optional.ofNullable(ownerStoreMapper.getOwnerByStore(storeSeq));
        return ownerSeq.orElse(19); //sample data
    }

    public List<StoreDTO> findByAccSeq(int accSeq) {
        Optional<List<StoreDTO>> storeList
                = Optional.ofNullable(ownerStoreMapper.findByAccSeq(accSeq));
        return storeList.orElse(new ArrayList<>());
    }

    public void toggleDisplay(int storeSeq, String newVal) {
        ownerStoreMapper.toggleDisplay(storeSeq, newVal);
    }

    public int selectOwnerSeq(int acc_seq) {
        return ownerStoreMapper.selectOwnerSeq(acc_seq);
    }
}
