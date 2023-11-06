package com.mmm.clout.memberservice.star.infrastructure.configuration;

import com.mmm.clout.memberservice.star.domain.repository.StarDetailRepository;
import com.mmm.clout.memberservice.star.domain.repository.StarRepository;
import com.mmm.clout.memberservice.star.infrastructure.persistence.StarAdapter;
import com.mmm.clout.memberservice.star.infrastructure.persistence.StarDetailAdapter;
import com.mmm.clout.memberservice.star.infrastructure.persistence.jpa.JpaStarDetailRepository;
import com.mmm.clout.memberservice.star.infrastructure.persistence.jpa.JpaStarRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class StarRepositoryConfig {

    @Bean
    public StarRepository starRepository(JpaStarRepository jpaStarRepository) {
        return new StarAdapter(jpaStarRepository);
    }

    @Bean
    public StarDetailRepository starDetailRepository(JpaStarDetailRepository jpaStarDetailRepository) {
        return new StarDetailAdapter(jpaStarDetailRepository);
    }
}
