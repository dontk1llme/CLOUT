package com.mmm.clout.userservice.clouter.infrastructure.configuration;

import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.userservice.advertiser.infrastructure.persistence.AdvertiserRepositoryAdapter;
import com.mmm.clout.userservice.advertiser.infrastructure.persistence.jpa.JpaAdvertiserRepository;
import com.mmm.clout.userservice.clouter.domain.repository.ClouterRepository;
import com.mmm.clout.userservice.clouter.infrastructure.persistence.ClouterRepositoryAdapter;
import com.mmm.clout.userservice.clouter.infrastructure.persistence.jpa.JpaClouterRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ClouterRepositoryConfig {

    @Bean
    public ClouterRepository clouterRepository(JpaClouterRepository jpaClouterRepository) {
        return new ClouterRepositoryAdapter(jpaClouterRepository);
    }
}
