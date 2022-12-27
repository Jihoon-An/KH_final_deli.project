package kh.deli.domain.owner.service;

import kh.deli.domain.owner.mapper.OwnerInfoMapper;
import kh.deli.global.entity.OwnerDTO;
import kh.deli.global.util.Encryptor;
import kh.deli.global.util.FileUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service
@AllArgsConstructor
public class OwnerInfoService {

    private final HttpSession session;
    private final OwnerInfoMapper ownerInfoMapper;

    public String findEmailBySeq(int accSeq) throws Exception {
        return ownerInfoMapper.findEmailBySeq(accSeq);
    }

    public OwnerDTO findOwnerInfoBySeq(int accSeq) throws Exception {
        return ownerInfoMapper.findOwnerInfoBySeq(accSeq);
    }

    public boolean modifyAccountPW(int accSeq, String oldPassWord, String newPassWord) throws Exception {
        Map<String, Object> oldParam = new HashMap<>();
        oldParam.put("acc_pw", Encryptor.getSHA512(oldPassWord));
        oldParam.put("acc_seq", accSeq);
        int checkOldPassWordResult = ownerInfoMapper.checkOldPassWord(oldParam);

        if (checkOldPassWordResult == 1) {
            Map<String, Object> newParam = new HashMap<>();
            newParam.put("acc_pw", Encryptor.getSHA512(newPassWord));
            newParam.put("acc_seq", accSeq);
            ownerInfoMapper.modifyAccountPW(newParam);
            return true;
        }else {
            return false;
        }
    }

    public void modifyOwnerInfo(OwnerDTO ownerDTO, MultipartFile file) throws Exception {

        if (!file.isEmpty()) {
            FileUtil fileUtil = new FileUtil();
            String path = "/resources/img/owner-card/";
            String sysName = fileUtil.save(session, path, file);

            String originalFile = ownerInfoMapper.findOwnerCardBySeq(ownerDTO.getAcc_seq());
            fileUtil.delete(session, path, originalFile);

            ownerInfoMapper.modifyOwnerInfo(ownerDTO);
            ownerInfoMapper.modifyOwnerCardImg(sysName, ownerDTO.getAcc_seq());
        } else {
            ownerInfoMapper.modifyOwnerInfo(ownerDTO);
        }
    }


}
