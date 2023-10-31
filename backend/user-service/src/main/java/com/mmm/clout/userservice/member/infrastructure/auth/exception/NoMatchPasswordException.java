package com.mmm.clout.userservice.member.infrastructure.auth.exception;

public class NoMatchPasswordException extends RuntimeException{

    public NoMatchPasswordException(String message) {
        super(message);
    }

}
