package com.mmm.clout.userservice.advertiser.infrastructure.exceptuion;

import com.mmm.clout.userservice.common.exception.CustomBaseException;
import com.mmm.clout.userservice.common.exception.ErrorCode;

public class NotFoundAdvertiser extends CustomBaseException{

    public NotFoundAdvertiser(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public NotFoundAdvertiser() {
        super(ErrorCode.NOT_F0UND_ADVERTISER);
    }
}
