package com.mmm.clout.memberservice.star.domain.exception;

import com.mmm.clout.memberservice.common.exception.CustomBaseException;
import com.mmm.clout.memberservice.common.exception.ErrorCode;

public class NotFoundMemberException extends CustomBaseException {
    public NotFoundMemberException(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public NotFoundMemberException() {
        super(ErrorCode.NOT_FOUND_MEMBER);
    }
}
