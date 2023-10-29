package com.mmm.clout.userservice.clouter.infrastructure.configuration;

import com.mmm.clout.userservice.advertiser.application.CreateAdvertiserProcessor;
import com.mmm.clout.userservice.advertiser.application.SelectAdvertiserProcessor;
import com.mmm.clout.userservice.advertiser.application.UpdateAdvertiserProcessor;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.userservice.clouter.application.CreateClouterProcessor;
import com.mmm.clout.userservice.clouter.application.UpdateClouterProcessor;
import com.mmm.clout.userservice.clouter.domain.repository.ClouterRepository;
import com.mmm.clout.userservice.member.domain.repository.MemberRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class ClouterConfig {

    @Bean
    public CreateClouterProcessor createClouterProcessor(
            ClouterRepository clouterRepository,
            MemberRepository memberRepository,
            BCryptPasswordEncoder encoder
    ) {
        return new CreateClouterProcessor(clouterRepository, memberRepository, encoder);
    }

    @Bean
    public UpdateClouterProcessor updateClouterProcessor(
            ClouterRepository clouterRepository, BCryptPasswordEncoder encoder
    ) {
        return new UpdateClouterProcessor(clouterRepository, encoder);
    }

//    @Bean
//    public SelectClouterProcessor selectClouterProcessor(
//            ClouterRepository clouterRepository
//    ) {
//        return new SelectClouterProcessor(clouterRepository);
//    }
}
