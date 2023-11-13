package com.mmm.clout.pointservice.point.presentation.request;

import io.swagger.v3.oas.annotations.media.Schema;
import javax.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreatePointRequest {

    @Schema(description = "회원가입시 포인트 초기화해야하는 멤버 고유 식별자(id)")
    @NotNull
    private Long memberId;

}
