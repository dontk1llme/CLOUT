package com.mmm.clout.advertisementservice.advertisements.infrastructure.config;

import com.mmm.clout.advertisementservice.advertisements.application.CreateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.DeleteCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.GetCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.UpdateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.common.msa.provider.MemberProvider;
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

    @Bean
    public DeleteCampaignProcessor deleteCampaignProcessor(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository
    ) {
        return new DeleteCampaignProcessor(campaignRepository);
    }

    @Bean
    GetCampaignProcessor getCampaignProcessor(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository,
        MemberProvider memberProvider
    ) {
        return new GetCampaignProcessor(
            campaignRepository,
            memberProvider
        );
    }
}
