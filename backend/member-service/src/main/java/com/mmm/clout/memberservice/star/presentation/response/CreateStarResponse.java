package com.mmm.clout.memberservice.star.presentation.response;

import com.mmm.clout.memberservice.star.domain.StarDetail;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateStarResponse {

    @Schema(description = "별점준 디테일 내역의 id값 리턴")
    private Long starDetailId;

    public static CreateStarResponse from(StarDetail starDetail) {
        return new CreateStarResponse(starDetail.getId());
    }
}
