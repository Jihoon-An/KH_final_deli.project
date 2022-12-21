package kh.deli.domain.owner.mapper;

import kh.deli.domain.member.order.dto.OrderBasketMenuDTO;
import kh.deli.global.entity.MenuDTO;
import kh.deli.global.entity.OwnerDTO;
import kh.deli.global.entity.StoreDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface OwnerStoreMapper {

    public void insertStore(StoreDTO dto);

    @Select(" SELECT STORE_ORIGIN FROM STORE,MENU WHERE MENU.STORE_SEQ=STORE.STORE_SEQ")
    public List<StoreDTO> menuOrigin();

    //식당 수정
    int modifyStore(StoreDTO storeDTO);


}
