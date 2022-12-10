package kh.deli.global.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class AllExceptionHandler {

    @ExceptionHandler(Exception.class)
    public String allExceptionHandler(Exception e) {
        e.printStackTrace();
        return "error";
    }
}
