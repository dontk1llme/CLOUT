package com.mmm.clout.memberservice.advertiser.presentation.response;

import com.mmm.clout.memberservice.advertiser.domain.Advertiser;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UpdateAdrResponse {

    @Schema(description = "수정된 광고주 id")
    private Long updatedAdrId;

    public static UpdateAdrResponse from(Advertiser advertiser) {
        return new UpdateAdrResponse(advertiser.getId());
    }
}
