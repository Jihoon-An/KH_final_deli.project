package kh.deli.domain.main.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import kh.deli.domain.main.mapper.AccountMapper;
import kh.deli.global.entity.AccountDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Service
@AllArgsConstructor
public class AccountService {
    private final AccountMapper accountMapper;
    private final RestTemplate restTemplate;

    public void sign(AccountDTO dto) throws Exception {
        accountMapper.insert(dto);
    }

    /**
     * <h2>email 중복체크</h2>
     *
     * @param email 검색할 email
     * @return 검색한 email이 있으면 true, 업으면 false
     */
    public boolean dupleCheck(String email) throws Exception {
        String result = accountMapper.findByEmail(email);

        if (result != null) {
            return true;
        }
        return false;
    }

    public int login(String email, String pw) throws Exception {
        Map<String, String> param = new HashMap<>();
        param.put("email", email);
        param.put("pw", pw);
//        param.put("pw", Encryptor.getSHA512(pw));
        return accountMapper.login(param);
    }

    public void memberSignUp(AccountDTO dto) throws Exception {
        accountMapper.memberSignUp(dto);
    }

    public String getKakaoAccessToken(String code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=1475b617eab69841d5cabd68f1527015"); // TODO REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost/account/oauth/kakao"); // TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();


            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
    }

    public String saveKakaoToken() {

        return "";
    }

    public String getKakaoId(String code) {

            String myTocken = "Bearer " + code;

            //헤더 객체 생성
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
            headers.set("Authorization", myTocken);

            //요청 url
            UriComponentsBuilder builder =
                    UriComponentsBuilder.fromHttpUrl("https://kapi.kakao.com/v2/user/me");

            HttpEntity<?> entity = new HttpEntity<>(headers);

            HttpEntity<String> response = null;

            //요청
            try {
                response = restTemplate.exchange(
                        builder.toUriString(),
                        HttpMethod.GET,
                        entity,
                        String.class);

                System.out.println("응답결과 :" + response.getBody());

            } catch (HttpStatusCodeException e) {

                System.out.println("error :" + e);

            }

            return response.getBody();
        }

}