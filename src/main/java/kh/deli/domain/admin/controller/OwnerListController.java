package kh.deli.domain.admin.controller;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import io.lettuce.core.ScriptOutputType;
import kh.deli.domain.admin.dto.AdminOwnerDTO;
import kh.deli.domain.admin.service.AdminOwnerService;
import kh.deli.global.entity.StoreDTO;
import kh.deli.global.util.FileUtil;
import lombok.AllArgsConstructor;
import org.apache.coyote.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.Reader;
import java.lang.reflect.Type;
import java.util.List;
@AllArgsConstructor
@Controller
@RequestMapping("/admin/owner/list")
public class OwnerListController {

    private  final AdminOwnerService adminOwnerService;

    private final HttpSession session;
    @RequestMapping("")
    public String toAdminOwner(Model model){
        List<AdminOwnerDTO> owner_list = adminOwnerService.selectOwnerList();

        // System.out.println(owner_list.get(3).getStore_count());
        System.out.println(owner_list.get(2).getAcc_seq());
        model.addAttribute("owner_list", owner_list);
        return "admin/adminOwnerList";
    }

    @RequestMapping("/deleteOwner")
    public String ownerDelete(int owner_seq, int acc_seq){
        Gson gson = new Gson();
        FileUtil file = new FileUtil();
        System.out.println(owner_seq+"acc"+acc_seq);

        List<Integer> storeSeqlist= adminOwnerService.selectStoreSeq(owner_seq);

        for(int i = 0; i<storeSeqlist.size(); i++) {

            //System.out.println(list.get(i).intValue());

            int store_seq = storeSeqlist.get(i).intValue();
          //System.out.println(store_seq); //store_Seq 출력 확인

            List<Integer> menuSeqList = adminOwnerService.selectMenuSeq(storeSeqlist.get(i).intValue());

            List<String> sysNameList = adminOwnerService.selectRevSysName(storeSeqlist.get(i).intValue());

            Type stringInListType = new TypeToken<List<String>>() {
            }.getType();
            gson.fromJson((Reader) sysNameList, stringInListType);
            System.out.println(sysNameList);
            for (String sysName : sysNameList) {
                file.delete(session, "/resources/img/review", sysName);
            }
          // sysName = gson.fromJson(sysName.get(i).Rev)

            for (int j = 0; j < menuSeqList.size(); j++) {
                System.out.println(menuSeqList.get(j).intValue());//menu_seq 리스트출력
                int menu_seq = menuSeqList.get(j).intValue();
//            //    System.out.println(menu_seq);
               // adminOwnerService.deleteMenuOption(menu_seq); //menu_seq로 menu_option 삭제
               // adminOwnerService.deleteMenu(store_seq);  //store_seq로 menu삭제
           //   adminOwnerService.deleteReview(store_seq);//store_Seq 로 review삭제

            }

        }
      //  adminOwnerService.deleteStore(owner_seq); //식당삭제
        //adminOwnerService.deleteOwner(owner_seq); //사업자 회원 삭제
        //adminOwnerService.deleteAccount(acc_seq); //account 테이블 사업자 회원 삭제
        return "redirect:";
    }
}
