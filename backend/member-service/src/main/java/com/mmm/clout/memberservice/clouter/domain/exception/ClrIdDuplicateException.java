package com.mmm.clout.memberservice.clouter.domain.exception;

import com.mmm.clout.memberservice.common.exception.CustomBaseException;
import com.mmm.clout.memberservice.common.exception.ErrorCode;

public class ClrIdDuplicateException extends CustomBaseException {

    public ClrIdDuplicateException(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public ClrIdDuplicateException() {
        super(ErrorCode.CLOUTER_ID_DUPLICATE);
    }
}
