package com.mmm.clout.userservice.advertiser.presentation.response;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UpdateAdrResponse {

    private Long createdAdrId;

    public static UpdateAdrResponse from(Advertiser advertiser) {
        return new UpdateAdrResponse(advertiser.getId());
    }
}
