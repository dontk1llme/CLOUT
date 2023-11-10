package com.mmm.clout.advertisementservice.advertisements.infrastructure.config;

import com.mmm.clout.advertisementservice.advertisements.application.CreateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.DeleteCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.EndCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.GetCampaignListByAdvertiser;
import com.mmm.clout.advertisementservice.advertisements.application.GetCampaignListByIdProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.GetCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.GetTop10CampaignListProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.SearchCampaignListProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.UpdateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import com.mmm.clout.advertisementservice.common.msa.provider.MemberProvider;
import com.querydsl.jpa.impl.JPAQueryFactory;
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
    public GetCampaignProcessor getCampaignProcessor(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository,
        MemberProvider memberProvider
    ) {
        return new GetCampaignProcessor(
            campaignRepository,
            memberProvider
        );
    }

    @Bean
    public GetTop10CampaignListProcessor getTop10CampaignListProcessor(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository,
        MemberProvider memberProvider
    ) {
        return new GetTop10CampaignListProcessor(
            campaignRepository,
            memberProvider
        );
    }

    @Bean
    public GetCampaignListByAdvertiser getCampaignListByAdvertiser(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository,
        MemberProvider memberProvider
    ) {
        return new GetCampaignListByAdvertiser(
            campaignRepository,
            memberProvider
        );
    }

    @Bean
    public EndCampaignProcessor endCampaignProcessor(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository,
        ApplyRepository applyRepository
    ) {
        return new EndCampaignProcessor(campaignRepository, applyRepository);
    }

    @Bean
    public SearchCampaignListProcessor searchCampaignListProcessor(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository,
        JPAQueryFactory jpaQueryFactory
    ) {
        return new SearchCampaignListProcessor(
            campaignRepository,
            jpaQueryFactory
        );
    }

    @Bean
    public GetCampaignListByIdProcessor getCampaignListByIdProcessor(
        @Qualifier("CampaignRepository") CampaignRepository campaignRepository
    ) {
        return new GetCampaignListByIdProcessor(campaignRepository);
    }
}
