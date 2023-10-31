package com.mmm.clout.memberservice.advertiser.infrastructure.exceptuion;

import com.mmm.clout.memberservice.common.exception.CustomBaseException;
import com.mmm.clout.memberservice.common.exception.ErrorCode;

public class NotFoundAdvertiser extends CustomBaseException{

    public NotFoundAdvertiser(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public NotFoundAdvertiser() {
        super(ErrorCode.NOT_F0UND_ADVERTISER);
    }
}
