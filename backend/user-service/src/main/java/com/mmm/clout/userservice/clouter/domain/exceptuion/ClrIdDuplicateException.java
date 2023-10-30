package com.mmm.clout.userservice.clouter.domain.exceptuion;

import com.mmm.clout.userservice.common.exception.CustomBaseException;
import com.mmm.clout.userservice.common.exception.ErrorCode;

public class ClrIdDuplicateException extends CustomBaseException {

    public ClrIdDuplicateException(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public ClrIdDuplicateException() {
        super(ErrorCode.CLOUTER_ID_DUPLICATE);
    }
}
