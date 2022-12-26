package kh.deli.domain.admin.service;


import kh.deli.domain.admin.dto.AdminOwnerDTO;
import kh.deli.domain.admin.mapper.AdminOwnerMapper;
import kh.deli.global.entity.StoreDTO;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Delete;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class AdminOwnerService {


   private final AdminOwnerMapper adminOwnerMapper; //초기화한 값을 끝까지 유지하기 위해 privat final사용


    public List<AdminOwnerDTO> selectOwnerList(){
       return adminOwnerMapper.selectOwnerList();
    }

    public int deleteOwner(int owner_seq){
        return adminOwnerMapper.deleteOwner(owner_seq);
    }


    public int deleteStore(int owner_seq){
        return adminOwnerMapper.deleteStore(owner_seq);
    }


    /**
     * menu 테이블 삭제를 위한 store_seq 추출
     * @param owner_seq
     * @return
     */
    public List<Integer>  selectStoreSeq(int owner_seq){
        return adminOwnerMapper.selectStoreSeq(owner_seq);
    }

    /**
     * menu_option 테이블 삭제를 위한 menu_seq 추출
     * @param store_seq
     * @return
     */
    public List<Integer> selectMenuSeq(int store_seq){
        return adminOwnerMapper.selectMenuSeq(store_seq);
    }



    /**
     *
     * @param store_seq
     * @return
     */
    public int deleteMenu(int store_seq){
        return adminOwnerMapper.deleteMenu(store_seq);
    }
    /**
     * 메뉴옵션 삭제
     * @param menu_seq
     * @return
     */
    public int deleteMenuOption(int menu_seq){
        return adminOwnerMapper.deleteMenuOption(menu_seq);
    }


    /**
     * 리뷰 삭제
     * @param store_seq
     * @return
     */
    public int deleteReview(int store_seq){
        return adminOwnerMapper.deleteReview(store_seq);
    }

    public int deleteAccount(int acc_seq){
        return adminOwnerMapper.deleteAccount(acc_seq);
    }

    public List<String> selectRevSysName(int store_seq){
      return    adminOwnerMapper.selectRevSysName(store_seq);
    }
}
