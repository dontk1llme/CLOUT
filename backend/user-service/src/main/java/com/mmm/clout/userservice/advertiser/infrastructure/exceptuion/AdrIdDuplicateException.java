package com.mmm.clout.userservice.advertiser.infrastructure.exceptuion;

import com.mmm.clout.userservice.common.exception.CustomBaseException;
import com.mmm.clout.userservice.common.exception.ErrorCode;

public class AdrIdDuplicateException extends CustomBaseException {

    public AdrIdDuplicateException(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public AdrIdDuplicateException() {
        super(ErrorCode.ADVERTISER_ID_DUPLICATE);
    }
}
