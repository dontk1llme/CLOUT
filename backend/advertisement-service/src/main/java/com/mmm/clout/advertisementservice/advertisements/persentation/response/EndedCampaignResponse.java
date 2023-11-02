package com.mmm.clout.advertisementservice.advertisements.persentation.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class EndedCampaignResponse {

    private Long endedCampaignId;

    public static EndedCampaignResponse from(Long endedCampaignId) {
        return new EndedCampaignResponse(endedCampaignId);
    }
}
