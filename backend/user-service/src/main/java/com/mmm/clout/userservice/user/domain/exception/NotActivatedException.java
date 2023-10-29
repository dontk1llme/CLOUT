package com.mmm.clout.userservice.user.domain.exception;

public class NotActivatedException extends RuntimeException{
    public NotActivatedException() {
        super();
    }

    public NotActivatedException(String message) {
        super(message);
    }

    public NotActivatedException(String message, Throwable cause) {
        super(message, cause);
    }

    public NotActivatedException(Throwable cause) {
        super(cause);
    }
}
