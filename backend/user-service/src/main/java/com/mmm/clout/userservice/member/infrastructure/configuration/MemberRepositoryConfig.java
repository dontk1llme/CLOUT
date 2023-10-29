package com.mmm.clout.userservice.member.infrastructure.configuration;

import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.userservice.advertiser.infrastructure.persistence.AdvertiserRepositoryAdapter;
import com.mmm.clout.userservice.advertiser.infrastructure.persistence.jpa.JpaAdvertiserRepository;
import com.mmm.clout.userservice.member.domain.repository.MemberRepository;
import com.mmm.clout.userservice.member.infrastructure.persistence.MemberRepositoryAdapter;
import com.mmm.clout.userservice.member.infrastructure.persistence.jpa.JpaMemberRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MemberRepositoryConfig {

    @Bean
    public MemberRepository memberRepository(JpaMemberRepository jpaMemberRepository) {
        return new MemberRepositoryAdapter(jpaMemberRepository);
    }
}
