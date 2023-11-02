package com.mmm.clout.chatservice.chatRoom.exception;

import com.mmm.clout.chatservice.common.exception.CustomBaseException;
import com.mmm.clout.chatservice.common.exception.ErrorCode;

public class NotFoundRoom extends CustomBaseException {
    public NotFoundRoom(String message, ErrorCode errorCode) {
        super(message, errorCode);
    }

    public NotFoundRoom() {
        super(ErrorCode.NOT_FOUND_CHATROOM);
    }
}
