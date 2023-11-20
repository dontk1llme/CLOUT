package com.mmm.clout.memberservice.member.infrastructure.auth.exception;

public class NoMatchPasswordException extends RuntimeException{

    public NoMatchPasswordException(String message) {
        super(message);
    }

}
