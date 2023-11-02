package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class GetTop10CampaignListProcessor {

    private final CampaignRepository campaignRepository;

    public List<Campaign> execute() {
        return campaignRepository.getTop10List();
    }
}
