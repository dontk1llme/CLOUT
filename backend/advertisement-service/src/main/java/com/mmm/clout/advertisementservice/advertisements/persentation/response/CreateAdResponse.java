package com.mmm.clout.advertisementservice.advertisements.persentation.response;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateAdResponse {

    private Long createdAdId;


    public static CreateAdResponse from(Campaign campaign) {
        return new CreateAdResponse(campaign.getId());
    }
}
