package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class GetCampaignListByIdProcessor {

    private final CampaignRepository campaignRepository;


    @Transactional
    public List<Campaign> execute(List<Long> adIdList) {
        List<Campaign> campaigns = campaignRepository.findByIdIn(adIdList);
        for (Campaign campaign : campaigns) {
            campaign.initializeCampaign();
        }
        return campaigns;
    }
}
