package kh.deli.global.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileUtil {
    /**
     * 기본 최대 파일 사이즈는 10Mb입니다.
     */
    private int maxSize = 1024 * 1024 * 10;
    private MultipartRequest multi;

    List<String> sysNameList = new ArrayList<>();

    /**
     * 파일을 저장함.
     *
     * @param session   File을 불러오는 session
     * @param path      파일을 저장할 경로<br>Ex) "/resources/profile"
     * @param file      저장할 파일
     * @return 저장된 파일의 system name
     * @throws IOException
     */
    public String save(HttpSession session, String path, MultipartFile file) throws IOException {

        //경로 저장
        String savePath = session.getServletContext().getRealPath(path); //런타임 webapp 폴더를 불러옴.
        File fileSavePath = new File(savePath);

        // 폴더 생성
        if (!fileSavePath.exists()) { //find directory
            fileSavePath.mkdir();//make directory
        }
        // 파일 저장
        String sysName = UUID.randomUUID() + "_" + file.getOriginalFilename();

        file.transferTo(new File(fileSavePath + "/" + sysName));

        return sysName;
    }


    /**
     * 기존에 있는 파일 지우기
     *
     * @param session  파일이 있는 실시간 경로를 찾기 위한 request
     * @param path     지울 파일이 있는 경로(!not savePath!)<br>Ex) "/resource/profile"
     * @param fileName 지울 파일 이름.
     */
    public void delete(HttpSession session, String path, String fileName) {
        String savePath = session.getServletContext().getRealPath(path);
        File file = new File(savePath + "/" + fileName);

        if (file.exists()) {
            file.delete();
        }
    }
}
