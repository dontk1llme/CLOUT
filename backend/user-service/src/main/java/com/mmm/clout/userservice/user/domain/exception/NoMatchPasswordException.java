package com.mmm.clout.userservice.user.domain.exception;

public class NoMatchPasswordException extends RuntimeException{

    public NoMatchPasswordException(String message) {
        super(message);
    }

}
