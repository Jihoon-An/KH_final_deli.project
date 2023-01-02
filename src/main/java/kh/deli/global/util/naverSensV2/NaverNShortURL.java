package kh.deli.global.util.naverSensV2;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class NaverNShortURL {
    @SuppressWarnings("unchecked")
    public String toShortURL(String url) {

        String clientId = "0MoAZ2I2BvVYFyr67W_D"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "glZTcLXOJP"; //애플리케이션 클라이언트 시크릿값"

        String apiURL = "https://openapi.naver.com/v1/util/shorturl";

        // POST 요청 부분 작성
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(apiURL).openConnection();
            conn.setRequestProperty("X-Naver-Client-Id", clientId);
            conn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            conn.setRequestMethod("POST"); // POST
            conn.setDoOutput(true); // POST

            // 단축시킬 URL을 담는 부분
            DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
            dos.writeBytes("url=" + toUTF8(url)); // 단축시킬 주소를 UTF-8 로 변환하여 담는다
            dos.close(); // 필수

            // json 형태의 응답값을 받는다.
            String line;
            StringBuilder json = new StringBuilder();
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            while ((line = br.readLine()) != null) {
                json.append(line + System.getProperty("line.separator"));
            }
            br.close();

            // url 부분만 뽑아내서 출력
            String shortenURL = getUrl(json.toString());

            return shortenURL;

        } catch (Exception e) {
            System.out.println(e);
        }

        return "";
    }

    // 변환시킬 주소를 UTF-8 형식으로 변환한다.
    public static String toUTF8(String url) {
        try {
            return URLEncoder.encode(url, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return url; // 변환 실패 시 기존 url 리턴
        }
    }

    // 응답받은 json 중 url 필드만 가져오는 메서드
    public static String getUrl(String json) throws IOException {
        ObjectMapper mapper = new ObjectMapper();

        HashMap<String, Object> response =
                mapper.readValue(json, HashMap.class); // json을 HashMap으로 매핑한다.

        LinkedHashMap<String, String> result =
                (LinkedHashMap<String, String>) response.get("result");

        return result.get("url"); // url의 value인 단축된 주소만 리턴
    }

}