package com.mmm.clout.memberservice.star.domain.exception;

import com.mmm.clout.memberservice.common.exception.CustomBaseException;
import com.mmm.clout.memberservice.common.exception.ErrorCode;

public class DuplicatedStarDetailException extends CustomBaseException {
    public DuplicatedStarDetailException() {
        super(ErrorCode.DUPLICATED_STAR_DETAIL_EXCEPTION);
    }
}
