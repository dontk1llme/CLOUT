package com.mmm.clout.memberservice.clouter.infrastructure.configuration;

import com.mmm.clout.memberservice.clouter.application.*;
import com.mmm.clout.memberservice.clouter.domain.repository.ClouterRepository;
import com.mmm.clout.memberservice.member.domain.provider.PointProvider;
import com.mmm.clout.memberservice.member.domain.repository.MemberRepository;
import com.mmm.clout.memberservice.star.domain.repository.StarRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class ClouterConfig {

    @Bean
    public SelectClouterForContractProcessor selectClouterForContractProcessor(
        ClouterRepository clouterRepository
    ) {
        return new SelectClouterForContractProcessor(clouterRepository);
    }

    @Bean
    public SelectTop10ClouterProcessor selectTop10ClouterProcessor(
        ClouterRepository clouterRepository
    ) {
        return new SelectTop10ClouterProcessor(clouterRepository);
    }

    @Bean
    public CreateClouterProcessor createClouterProcessor(
            ClouterRepository clouterRepository,
            MemberRepository memberRepository,
            BCryptPasswordEncoder encoder,
            StarRepository starRepository,
            PointProvider pointProvider
    ) {
        return new CreateClouterProcessor(clouterRepository, memberRepository, encoder, starRepository, pointProvider);
    }

    @Bean
    public UpdateClouterProcessor updateClouterProcessor(
            ClouterRepository clouterRepository, BCryptPasswordEncoder encoder
    ) {
        return new UpdateClouterProcessor(clouterRepository, encoder);
    }

    @Bean
    public SelectClouterProcessor selectClouterProcessor(
            ClouterRepository clouterRepository
    ) {
        return new SelectClouterProcessor(clouterRepository);
    }
}
