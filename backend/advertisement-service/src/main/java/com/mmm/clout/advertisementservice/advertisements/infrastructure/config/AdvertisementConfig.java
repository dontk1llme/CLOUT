package com.mmm.clout.advertisementservice.advertisements.infrastructure.config;

import com.mmm.clout.advertisementservice.advertisements.application.CreateAdvertisementProcessor;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.AdvertisementRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AdvertisementConfig {

    @Bean
    public CreateAdvertisementProcessor createAdvertisementProcessor(
        AdvertisementRepository advertisementRepository
    ) {
        return new CreateAdvertisementProcessor(
            advertisementRepository
        );
    }

}
