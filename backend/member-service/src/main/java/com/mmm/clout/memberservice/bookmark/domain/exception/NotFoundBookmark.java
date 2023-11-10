package com.mmm.clout.memberservice.bookmark.domain.exception;

import com.mmm.clout.memberservice.common.exception.CustomBaseException;
import com.mmm.clout.memberservice.common.exception.ErrorCode;

public class NotFoundBookmark extends CustomBaseException {
    public NotFoundBookmark() {
        super(ErrorCode.NOT_FOUND_BOOKMARK);
    }
}
