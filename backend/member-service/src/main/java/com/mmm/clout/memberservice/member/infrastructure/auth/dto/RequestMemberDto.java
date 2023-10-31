package com.mmm.clout.memberservice.member.infrastructure.auth.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
@AllArgsConstructor
public class RequestMemberDto {
    private String userId;
    private String newPassword;
    private String oldPassword;
}
