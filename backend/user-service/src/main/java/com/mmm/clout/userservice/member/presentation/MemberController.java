package com.mmm.clout.userservice.member.presentation;

import com.mmm.clout.userservice.common.entity.sms.SmsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
@RequestMapping("/members")
@RequiredArgsConstructor
public class MemberController {

    private final SmsService smsService;

    @GetMapping("/sendsms")
    public ResponseEntity<String> sendSms(
        @RequestParam String phoneNumber
    ) {
        String result = smsService.smsSend(phoneNumber, makeAuthKey());
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    private String makeAuthKey() {
        Random random = new Random();
        int randomNumber = random.nextInt(9000) + 1000;
        String randomString = String.valueOf(randomNumber);
        return randomString;
    }
}
