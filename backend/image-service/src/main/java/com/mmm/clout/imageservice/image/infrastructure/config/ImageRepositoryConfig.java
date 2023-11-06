package com.mmm.clout.imageservice.image.infrastructure.config;

import com.mmm.clout.imageservice.image.domain.repository.ImageRepository;
import com.mmm.clout.imageservice.image.infrastructure.persistance.ImageRepositoryAdapter;
import com.mmm.clout.imageservice.image.infrastructure.persistance.jpa.JpaImageRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ImageRepositoryConfig {
    @Bean
    public ImageRepository imageRepository(JpaImageRepository jpaImageRepository) {
        return new ImageRepositoryAdapter(jpaImageRepository);
    }
}
