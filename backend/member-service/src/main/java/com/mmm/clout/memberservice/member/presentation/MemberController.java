package com.mmm.clout.memberservice.member.presentation;

import com.mmm.clout.memberservice.common.entity.sms.SmsService;
import com.mmm.clout.memberservice.member.infrastructure.auth.dto.AuthDto;
import com.mmm.clout.memberservice.member.infrastructure.auth.service.AuthService;
import com.mmm.clout.memberservice.member.infrastructure.auth.service.MemberService;
import com.mmm.clout.memberservice.member.presentation.docs.MemberControllerDocs;
import com.mmm.clout.memberservice.member.presentation.request.PwdUpdateRequst;
import com.mmm.clout.memberservice.member.presentation.response.IdDuplicateResponse;
import com.mmm.clout.memberservice.member.presentation.response.PwdUpdateResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Id;
import javax.validation.Valid;
import java.util.Map;
import java.util.Random;

@RestController
@RequestMapping("/v1/members")
@RequiredArgsConstructor
public class MemberController implements MemberControllerDocs {

    private final AuthService authService;
    private final SmsService smsService;
    private final MemberService memberService;
    private final BCryptPasswordEncoder encoder;


    private final long COOKIE_EXPIRATION = 7776000; // 90일

    // 로그인 -> 토큰 발급
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody @Valid AuthDto.LoginDto loginDto) {
        AuthDto.TokenDto tokenDto = authService.login(loginDto);
        return ResponseEntity.ok()
            .header("REFRESH_TOKEN", tokenDto.getRefreshToken())

            .header(HttpHeaders.AUTHORIZATION, "Bearer " + tokenDto.getAccessToken())
            .build();
    }

    @GetMapping("/duplicate")
    public ResponseEntity<IdDuplicateResponse> duplicateCheck(
        @RequestParam("userId") String userId
    ) {
        IdDuplicateResponse response = new IdDuplicateResponse(authService.dupicateCheck(userId));
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    // 토큰 재발급
    @PostMapping("/reissue")
    public ResponseEntity<?> reissue(
            @RequestHeader("REFRESH_TOKEN") String requestRefreshToken,
            @RequestHeader(HttpHeaders.AUTHORIZATION) String requestAccessToken
                                     ) {
        AuthDto.TokenDto reissuedTokenDto = authService.reissue(requestAccessToken, requestRefreshToken);

        if (reissuedTokenDto != null) { // 토큰 재발급 성공
            return ResponseEntity
                .status(HttpStatus.OK)
                .header("REFRESH_TOKEN", reissuedTokenDto.getRefreshToken())
                .header(HttpHeaders.AUTHORIZATION, "Bearer " + reissuedTokenDto.getAccessToken())
                .build();

        } else { // Refresh Token 탈취 가능성
            System.out.println("재로그인 유도");
            // Cookie 삭제 후 재로그인 유도

            return ResponseEntity
                .status(HttpStatus.UNAUTHORIZED)
                .header("REFRESH_TOKEN", "")
                .build();
        }
    }

    // 로그아웃
    @PostMapping("/logout")
    public ResponseEntity<?> logout(@RequestHeader("Authorization") String requestAccessToken) {
        authService.logout(requestAccessToken);

        return ResponseEntity
            .status(HttpStatus.OK)
            .header("REFRESH_TOKEN", "")
            .build();
    }

    @GetMapping("/sendsms")
    public ResponseEntity<String> sendSms(
        @RequestParam String phoneNumber
    ) {
        String result = smsService.smsSend(phoneNumber, makeAuthKey());
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PatchMapping("/pwd")
    public ResponseEntity<PwdUpdateResponse> pwdUpdate(
        @RequestBody PwdUpdateRequst request
    ) {
        PwdUpdateResponse response = PwdUpdateResponse.from(
            memberService.updateUserPassword(request)
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    private String makeAuthKey() {
        Random random = new Random();
        int randomNumber = random.nextInt(9000) + 1000;
        String randomString = String.valueOf(randomNumber);
        return randomString;
    }
}
