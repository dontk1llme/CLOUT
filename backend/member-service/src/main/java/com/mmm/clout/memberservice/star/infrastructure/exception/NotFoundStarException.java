package com.mmm.clout.memberservice.star.infrastructure.exception;

import com.mmm.clout.memberservice.common.exception.CustomBaseException;
import com.mmm.clout.memberservice.common.exception.ErrorCode;

public class NotFoundStarException extends CustomBaseException {
    public NotFoundStarException(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public NotFoundStarException() {
        super(ErrorCode.NOT_FOUND_STAR);
    }
}
