package com.mmm.clout.advertisementservice.advertisements.infrastructure.config;

import com.mmm.clout.advertisementservice.advertisements.application.CreateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.UpdateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AdvertisementConfig {

    @Bean
    public CreateCampaignProcessor createAdvertisementProcessor(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository
    ) {
        return new CreateCampaignProcessor(campaignRepository);
    }

    @Bean
    public UpdateCampaignProcessor updateCampaignProcessor(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository
    ) {
        return new UpdateCampaignProcessor(campaignRepository);
    }
}
