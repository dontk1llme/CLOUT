package com.mmm.clout.memberservice.advertiser.infrastructure.configuration;

import com.mmm.clout.memberservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.memberservice.advertiser.infrastructure.persistence.AdvertiserRepositoryAdapter;
import com.mmm.clout.memberservice.advertiser.infrastructure.persistence.jpa.JpaAdvertiserRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AdvertiserRepositoryConfig {

    @Bean
    public AdvertiserRepository advertiserRepository(JpaAdvertiserRepository jpaAdvertiserRepository) {
        return new AdvertiserRepositoryAdapter(jpaAdvertiserRepository);
    }
}
