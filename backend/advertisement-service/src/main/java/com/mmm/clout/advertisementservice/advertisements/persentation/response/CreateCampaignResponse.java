package com.mmm.clout.advertisementservice.advertisements.persentation.response;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateCampaignResponse {

    private Long createdAdId;


    public static CreateCampaignResponse from(Campaign campaign) {
        return new CreateCampaignResponse(campaign.getId());
    }
}
