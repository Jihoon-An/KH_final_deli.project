package kh.deli.global.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Slf4j
@ControllerAdvice
public class AllExceptionHandler {
    @ExceptionHandler(PermissionException.class)
    public String permissionExceptionHandler(StoreBsTimeOutException e) {
        log.error("페이지에 권한이 없습니다.");
        return "error";
    }

    @ExceptionHandler(StoreBsTimeOutException.class)
    public String storeBsTimeOutExceptionHandler(StoreBsTimeOutException e) {
        log.error("식당이 현재 운영시간이 아닙니다.");
        return "error";
    }

    @ExceptionHandler(Exception.class)
    public String allExceptionHandler(Exception e) {
        e.printStackTrace();
        return "error";
    }
}
