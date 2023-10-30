package com.mmm.clout.userservice.advertiser.infrastructure.configuration;

import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.userservice.advertiser.infrastructure.persistence.AdvertiserRepositoryAdapter;
import com.mmm.clout.userservice.advertiser.infrastructure.persistence.jpa.JpaAdvertiserRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AdvertiserRepositoryConfig {

    @Bean
    public AdvertiserRepository advertiserRepository(JpaAdvertiserRepository jpaAdvertiserRepository) {
        return new AdvertiserRepositoryAdapter(jpaAdvertiserRepository);
    }
}
