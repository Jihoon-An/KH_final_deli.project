package kh.deli.global.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Slf4j
@ControllerAdvice
public class AllExceptionHandler {
    @ExceptionHandler(PermissionException.class)
    public String permissionExceptionHandler(PermissionException e) {
        log.error("페이지에 권한이 없습니다.");
        return "errorPage/permissionException";
    }

    @ExceptionHandler(StoreBsTimeOutException.class)
    public String storeBsTimeOutExceptionHandler(StoreBsTimeOutException e) {
        log.error("식당이 현재 운영시간이 아닙니다.");
        return "errorPage/storeBsTimeOutException";
    }

    @ExceptionHandler(DeliveryDtlException.class)
    public String deliveryDtlExceptionHandler(DeliveryDtlException e) {
        log.error("딜리 배달 영수증에 접근 권한이 없습니다.");
        return "errorPage/deliveryDtlException";
    }

    @ExceptionHandler(Exception.class)
    public String allExceptionHandler(Exception e) {
        e.printStackTrace();
        return "error";
    }
}
