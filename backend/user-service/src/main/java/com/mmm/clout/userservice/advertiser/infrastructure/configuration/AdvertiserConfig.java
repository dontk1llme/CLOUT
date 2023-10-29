package com.mmm.clout.userservice.advertiser.infrastructure.configuration;

import com.mmm.clout.userservice.advertiser.application.CreateAdvertiserProcessor;
import com.mmm.clout.userservice.advertiser.application.UpdateAdvertiserProcessor;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class AdvertiserConfig {

    @Bean
    public CreateAdvertiserProcessor createAdvertiserProcessor(
        AdvertiserRepository advertiserRepository, BCryptPasswordEncoder encoder
    ) {
        return new CreateAdvertiserProcessor(advertiserRepository, encoder);
    }

    @Bean
    public UpdateAdvertiserProcessor updateAdvertiserProcessor(
            AdvertiserRepository advertiserRepository, BCryptPasswordEncoder encoder
    ) {
        return new UpdateAdvertiserProcessor(advertiserRepository, encoder);
    }
}
