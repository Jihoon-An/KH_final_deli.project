package kh.deli.global.util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Encryptor {

    /**
     * <h3>비밀번호 암호화 유틸</h3>
     * @param inputPw
     * @return getSHA512(inputPw)
     */
    public static String getSHA512(String inputPw) {
        String result = null;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-512");
            digest.reset();
            digest.update(inputPw.getBytes("utf8"));
            result = String.format("%0128x", new BigInteger(1, digest.digest()));
        }catch(Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}
