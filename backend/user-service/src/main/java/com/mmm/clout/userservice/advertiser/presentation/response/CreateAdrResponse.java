package com.mmm.clout.userservice.advertiser.presentation.response;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateAdrResponse {

    private Long createdAdrId;

    public static CreateAdrResponse from(Advertiser advertiser) {
        return new CreateAdrResponse(advertiser.getId());
    }
}
