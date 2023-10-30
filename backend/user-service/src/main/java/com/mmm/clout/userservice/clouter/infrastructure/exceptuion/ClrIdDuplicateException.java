package com.mmm.clout.userservice.clouter.infrastructure.exceptuion;

import com.mmm.clout.userservice.common.exception.CustomBaseException;
import com.mmm.clout.userservice.common.exception.ErrorCode;

public class ClrIdDuplicateException extends CustomBaseException {

    public ClrIdDuplicateException(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public ClrIdDuplicateException(ErrorCode errorCode) {
        super(errorCode);
    }
}
