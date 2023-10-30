package com.mmm.clout.userservice.clouter.infrastructure.exceptuion;

import com.mmm.clout.userservice.common.exception.ErrorCode;
import com.mmm.clout.userservice.common.exception.ErrorResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class ClouterControllerAdvice {

    // TODO 401, 403, validation error
    @ExceptionHandler(ClrIdDuplicateException.class)
    protected ResponseEntity<ErrorResponse> handle(ClrIdDuplicateException e) {
        log.error("Business CustomException: {}", e.getMessage());
        return createErrorResponseEntity(e.getErrorCode());
    }
    private ResponseEntity<ErrorResponse> createErrorResponseEntity(ErrorCode errorCode) {
        return new ResponseEntity<>(ErrorResponse.of(errorCode), errorCode.getStatus());
    }
}
