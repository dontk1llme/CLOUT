package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.exception.CampaignNotFoundException;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class GetCampaignProcessor {

    private final CampaignRepository campaignRepository;
    public CampaignReader execute(Long advertisementId) {
        Campaign campaign = campaignRepository.findById(advertisementId)
            .orElseThrow(CampaignNotFoundException::new);

        return null;
    }
}
