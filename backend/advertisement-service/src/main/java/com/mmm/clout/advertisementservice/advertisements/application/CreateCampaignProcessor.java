package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.command.CreateCampaignCommand;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateCampaignProcessor {

    private final CampaignRepository campaignRepository;

    @Transactional
    public Campaign execute(CreateCampaignCommand command) {
        Campaign campaign = Campaign.create(
            command.getRegisterId(),
            command.getAdPlatformList(),
            command.getPrice(),
            command.getDetails(),
            command.getTitle(),
            command.getAdCategory(),
            command.isPriceChangeable(),
            command.isDeliveryRequired(),
            command.getNumberOfRecruiter(),
            command.getOfferingDetails(),
            command.getSellingLink(),
            command.getMinClouterAge(),
            command.getMaxClouterAge(),
            command.getMinFollower(),
            command.getRegionList()
        );
        return campaignRepository.save(campaign);
    }
}
