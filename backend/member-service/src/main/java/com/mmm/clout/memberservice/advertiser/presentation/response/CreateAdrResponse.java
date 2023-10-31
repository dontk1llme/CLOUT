package com.mmm.clout.memberservice.advertiser.presentation.response;

import com.mmm.clout.memberservice.advertiser.domain.Advertiser;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateAdrResponse {

    @Schema(description = "생성된 광고주 id")
    private Long createdAdrId;

    public static CreateAdrResponse from(Advertiser advertiser) {
        return new CreateAdrResponse(advertiser.getId());
    }
}
