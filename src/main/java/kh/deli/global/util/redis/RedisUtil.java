package kh.deli.global.util.redis;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import java.time.Duration;
import java.util.concurrent.TimeUnit;

@Repository
public class RedisUtil {

    private final int LIMIT_TIME = 3 * 60;

    private final RedisTemplate<String, Object> redisTemplate;

    public RedisUtil(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void setData(String key, String value){
        redisTemplate.opsForValue().set(key, value, Duration.ofSeconds(LIMIT_TIME));
    }

    public String getData(String key){
        return (String) redisTemplate.opsForValue().get(key);
    }

    public void deleteData(String key){
        redisTemplate.delete(key);
    }


//    private final String PREFIX = "sms:";  // (1)
//    private final int LIMIT_TIME = 3 * 60;  // (2)
//
//    private final StringRedisTemplate stringRedisTemplate;
//
//    public void createCertification(String certifyKey, String randomStr) { //(3)
//        stringRedisTemplate.opsForValue()
//                .set(PREFIX + certifyKey, randomStr, Duration.ofSeconds(LIMIT_TIME));
//    }
//
//    public String getCertification(String certifyKey) { // (4)
//        return stringRedisTemplate.opsForValue().get(PREFIX + certifyKey);
//    }
//
//    public void removeCertification(String certifyKey) { // (5)
//        stringRedisTemplate.delete(PREFIX + certifyKey);
//    }
//
//    public boolean hasKey(String certifyKey) {  //(6)
//        return stringRedisTemplate.hasKey(PREFIX + certifyKey);
//    }

//(1) Redis에 저장되는 Key값이 중복되지 않도록 상수 선언
//(2) Redis에서 해당 데이터의 유효시간(TTL)을 설정
//(3) 사용자가 입력한 휴대폰 번호와 인증번호를 저장하고 TTL을 180초로 설정
//(4) Redis에서 휴대폰번호(KEY)에 해당하는 인증번호를 리턴
//(5) 인증이 완료되었을 경우 메모리 관리를 위해 Redis에 저장된 인증번호 삭제
//(6) Redis에 해당 휴대폰번호(KEY)로 저장된 인증번호(VALUE)가 존재하는지 확인

}
