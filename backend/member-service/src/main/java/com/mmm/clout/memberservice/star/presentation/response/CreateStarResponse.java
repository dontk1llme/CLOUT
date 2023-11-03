package com.mmm.clout.memberservice.star.presentation.response;

import com.mmm.clout.memberservice.star.domain.StarDetail;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateStarResponse {

    private Long starDetailId;

    public static CreateStarResponse from(StarDetail starDetail) {
        return new CreateStarResponse(starDetail.getId());
    }
}
