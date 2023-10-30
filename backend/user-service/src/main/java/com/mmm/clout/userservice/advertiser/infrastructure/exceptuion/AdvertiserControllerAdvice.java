package com.mmm.clout.userservice.advertiser.infrastructure.exceptuion;

import com.mmm.clout.userservice.common.exception.CustomBaseException;
import com.mmm.clout.userservice.common.exception.ErrorCode;
import com.mmm.clout.userservice.common.exception.ErrorResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.security.sasl.AuthenticationException;
import java.nio.file.AccessDeniedException;

@Slf4j
@RestControllerAdvice
public class AdvertiserControllerAdvice {

    // TODO 401, 403, validation error
    @ExceptionHandler(AdrIdDuplicateException.class)
    protected ResponseEntity<ErrorResponse> handle(AdrIdDuplicateException e) {
        log.error("Business CustomException: {}", e.getMessage());
        return createErrorResponseEntity(e.getErrorCode());
    }
    private ResponseEntity<ErrorResponse> createErrorResponseEntity(ErrorCode errorCode) {
        return new ResponseEntity<>(ErrorResponse.of(errorCode), errorCode.getStatus());
    }
}
