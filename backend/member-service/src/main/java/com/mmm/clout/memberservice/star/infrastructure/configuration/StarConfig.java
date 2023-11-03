package com.mmm.clout.memberservice.star.infrastructure.configuration;

import com.mmm.clout.memberservice.star.application.CreateStarDetailProcessor;
import com.mmm.clout.memberservice.star.domain.repository.StarDetailRepository;
import com.mmm.clout.memberservice.star.domain.repository.StarRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class StarConfig {

    @Bean
    public CreateStarDetailProcessor createStarDetailProcessor(
        StarDetailRepository starDetailRepository,
        StarRepository starRepository) {
        return new CreateStarDetailProcessor(starDetailRepository,starRepository);
    }


}
