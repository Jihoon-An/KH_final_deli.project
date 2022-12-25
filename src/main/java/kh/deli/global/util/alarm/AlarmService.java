package kh.deli.global.util.alarm;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AlarmService {
    private final AlarmEndpoint alarmEndpoint;

    public void OnMessage(String msg) {
        alarmEndpoint.OnMessage(msg);
    }
}
