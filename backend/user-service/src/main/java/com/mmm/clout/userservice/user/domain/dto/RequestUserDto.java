package com.mmm.clout.userservice.user.domain.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
@AllArgsConstructor
public class RequestUserDto {
    private String userId;
    private String newPassword;
    private String oldPassword;
}
