package com.mmm.clout.advertisementservice.advertisements.infrastructure.config;

import com.mmm.clout.advertisementservice.advertisements.domain.repository.AdvertisementRepository;
import com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence.AdvertisementRepositoryAdapter;
import com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence.jpa.JpaAdvertisementRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AdvertisementRepositoryConfig {

    @Bean
    public AdvertisementRepository AdvertisementRepository(JpaAdvertisementRepository jpaAdvertisementRepository) {
        return new AdvertisementRepositoryAdapter(jpaAdvertisementRepository);
    }

}
