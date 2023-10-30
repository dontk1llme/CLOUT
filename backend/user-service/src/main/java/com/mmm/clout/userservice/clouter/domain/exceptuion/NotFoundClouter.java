package com.mmm.clout.userservice.clouter.domain.exceptuion;

import com.mmm.clout.userservice.common.exception.CustomBaseException;
import com.mmm.clout.userservice.common.exception.ErrorCode;

public class NotFoundClouter extends CustomBaseException {
    public NotFoundClouter(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public NotFoundClouter() {
        super(ErrorCode.NOT_F0UND_CLOUTER);
    }
}
