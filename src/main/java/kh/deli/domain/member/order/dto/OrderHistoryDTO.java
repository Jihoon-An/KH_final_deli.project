package kh.deli.domain.member.order.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderHistoryDTO {
    private int store_seq;
    private String store_name;
    private String store_add_detail2;
    private String add_detail2;
    private String store_bsns_hours;
    private String store_logo;
    private Timestamp order_date;
    private int order_seq;
    private int acc_seq;
    private String menu_list;
    private int order_price;
    private int pay_price;
    private String order_status;
    private String order_rider_req;
    private String order_store_req;


    public String getFormDate() {

        long writeTime = this.order_date.getTime();
        long currentTime = System.currentTimeMillis();

        //System.currentTimeMillis()
        //1970년 1월 1일부터 경과한 시간을 long값으로 리턴 1/1000 초값을리턴
        long timeGap = currentTime - writeTime;
//		System.out.println(timeGap);

        if(timeGap<60*1000) {
            return "1분 이내";
        }else if(timeGap <300*1000) {
            return "5분 이내";
        }else if(timeGap <3600*1000) {
            return "1시간 이내";
        }else if(timeGap < 86400*1000) {
            return "24시간 이내";
        }else {
            SimpleDateFormat sdf = new SimpleDateFormat("MM월dd일 hh시");
            //SimpleDateFormat sdf = new SimpleDateFormat("MM월dd일 hh시mm분");
            return sdf.format(writeTime);
        }


    }

}
