package com.mmm.clout.memberservice.member.infrastructure.auth.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice(basePackages = "com.example.Strange505.user") // 외에 여러 지정 방법이 있다.
public class ExControllerAdvice {
    @ExceptionHandler
    public ResponseEntity<String> userExHandler(NotActivatedException e) {
        log.error("[exceptionHandler] {}", e);
        return new ResponseEntity<>(e.getMessage(), HttpStatus.UNAUTHORIZED);
    }

//    @ExceptionHandler
//    public ResponseEntity<String> passwordExHandlerForWithdraw(NoMatchPasswordException e) {
//        log.error("[exceptionHandler] {}", e);
//        return new ResponseEntity<>(e.getMessage(), HttpStatus.UNAUTHORIZED);
//    }

    @ExceptionHandler
    public ResponseEntity<String> passwordHandlerForLogin(PasswordException e) {
        log.error("[exceptionHandler] {}", e);
        return new ResponseEntity<>(e.getMessage(), HttpStatus.UNAUTHORIZED);
    }

    @ExceptionHandler
    public ResponseEntity<String> EmailHandlerForLogin(EmailException e) {
        log.error("[exceptionHandler] {}", e);
        return new ResponseEntity<>(e.getMessage(), HttpStatus.UNAUTHORIZED);
    }
}
