package com.mmm.clout.memberservice.advertiser.infrastructure.exception;

import com.mmm.clout.memberservice.common.exception.CustomBaseException;
import com.mmm.clout.memberservice.common.exception.ErrorCode;

public class AdrIdDuplicateException extends CustomBaseException {

    public AdrIdDuplicateException(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public AdrIdDuplicateException() {
        super(ErrorCode.ADVERTISER_ID_DUPLICATE);
    }
}
