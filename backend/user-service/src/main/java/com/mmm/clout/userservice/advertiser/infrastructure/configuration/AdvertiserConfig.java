package com.mmm.clout.userservice.advertiser.infrastructure.configuration;

import com.mmm.clout.userservice.advertiser.application.CreateAdvertiserProcessor;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AdvertiserConfig {

    @Bean
    public CreateAdvertiserProcessor createAdvertiserProcessor(
        AdvertiserRepository advertiserRepository
    ) {
        return new CreateAdvertiserProcessor(advertiserRepository);
    }
}
