package com.mmm.clout.userservice.user.presentation;

import com.mmm.clout.userservice.user.domain.dto.AuthDto;
import com.mmm.clout.userservice.user.domain.service.AuthService;
import com.mmm.clout.userservice.user.domain.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthApiController {

    private final AuthService authService;
    private final UserService userService;
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

    @PostMapping("/validate")
    public ResponseEntity<?> validate(@RequestHeader("Authorization") String requestAccessToken) {
        if (!authService.validate(requestAccessToken)) {
            return ResponseEntity.status(HttpStatus.OK).build(); // 재발급 필요X
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // 재발급 필요
        }
    }
    // 토큰 재발급
    @PostMapping("/reissue")
    public ResponseEntity<?> reissue(@RequestHeader() Map<String, String> headers) {
        System.out.println("headers: "+headers);
        String requestAccessToken = headers.get("authorization");
        String requestRefreshToken = headers.get("refresh_token");
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
}
