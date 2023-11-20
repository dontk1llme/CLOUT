package com.mmm.clout.memberservice.clouter.domain.exception;

import com.mmm.clout.memberservice.common.exception.CustomBaseException;
import com.mmm.clout.memberservice.common.exception.ErrorCode;

public class NotFoundClouterException extends CustomBaseException {
    public NotFoundClouterException(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public NotFoundClouterException() {
        super(ErrorCode.NOT_F0UND_CLOUTER);
    }
}
