package com.mmm.clout.advertisementservice.apply.infrastructure.config;

import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.apply.application.CancelApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.CreateApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.ReadAllApplyProcessor;
import com.mmm.clout.advertisementservice.apply.domain.provider.AdvertiserProvider;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApplyConfig {

    @Bean
    CreateApplyProcessor createApplyProcessor(
        ApplyRepository applyRepository,
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository
    ) {
        return new CreateApplyProcessor(
            applyRepository,
            campaignRepository
        );
    }

    @Bean
    CancelApplyProcessor cancelApplyProcessor(
        ApplyRepository applyRepository
    ) {
        return new CancelApplyProcessor(
            applyRepository
        );
    }

    @Bean
    ReadAllApplyProcessor readAllApplyProcessor(
        ApplyRepository applyRepository,
        AdvertiserProvider advertiserInfoProvider

    ) {
        return new ReadAllApplyProcessor(
            applyRepository,
            advertiserInfoProvider
        );
    }

}
