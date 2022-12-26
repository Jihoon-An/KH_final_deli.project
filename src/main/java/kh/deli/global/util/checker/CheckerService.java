package kh.deli.global.util.checker;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.deli.domain.member.store.mapper.StoreStoreMapper;
import kh.deli.global.exception.StoreBsTimeOutException;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class CheckerService {

    private final StoreStoreMapper storeMapper;
    private final Gson gson;

    private final List<String> weekList = List.of("sun", "mon", "tue", "wed", "thu", "fri", "sat");

    /**
     * @return 운영시간이면 true
     */
    public boolean storeBsTimeCheck(int storeSeq) throws ParseException {
        StoreOpenCheckListDTO openCheckList = storeMapper.getOpenCheckListBySeq(storeSeq);
        Type type = new TypeToken<Map<String, Map<String, String>>>() {
        }.getType();
        Map<String, Map<String, String>> storeBsTimeInfo = gson.fromJson(openCheckList.getBs_time_json(), type);

        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");

        Date nowDate = new Date(System.currentTimeMillis());
        Long now = nowDate.getTime() % (60 * 60 * 24 * 1000);

        Map<String, String> storeBsTimeOfWeek = storeBsTimeInfo
                .get(weekList.get(Calendar.getInstance().get(Calendar.DAY_OF_WEEK)));

        // 요일별 체크
        if (storeBsTimeOfWeek.get("open") != "휴무일"
                && openCheckList.getOpen() == "Y"
                && openCheckList.getDisplay() == "Y") {
            //open info
            String openTimeStr = storeBsTimeOfWeek.get("open_time");
            Date openTimeDate = formatter.parse(openTimeStr);
            Long openTime = openTimeDate.getTime();
            //close info
            String closeTimeStr = storeBsTimeOfWeek.get("close_time");
            Date closeTimeDate = formatter.parse(closeTimeStr);
            Long closeTime = closeTimeDate.getTime();

            if (now < openTime || now > closeTime) {
                return false;
            }
            return true;
        }
        return false;
    }

    public void storeBsTimeCheckToError(int storeSeq) throws ParseException, StoreBsTimeOutException {
        if (this.storeBsTimeCheck(storeSeq) == false) {
            throw new StoreBsTimeOutException();
        }
    }
}
