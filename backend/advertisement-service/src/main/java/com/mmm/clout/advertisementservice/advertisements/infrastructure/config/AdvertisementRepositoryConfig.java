package com.mmm.clout.advertisementservice.advertisements.infrastructure.config;

import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence.CampaignRepositoryAdapter;
import com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence.jpa.JpaCampaignRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AdvertisementRepositoryConfig {

    @Bean
    public CampaignRepository CampaignRepository(JpaCampaignRepository jpaCampaignRepository) {
        return new CampaignRepositoryAdapter(jpaCampaignRepository);
    }

}
